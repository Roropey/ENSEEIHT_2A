import java.util.*;

public class MaxTabThread {
    
    static class PartialMax implements Runnable {
        private int start;
        private int end;
        private int[] array;
        private List<Integer> results;

        PartialMax(int[] array, int start, int end, List<Integer> results) {
            this.array = array;
            this.start = start;
            this.end = end;
            this.results = results;
        }

        @Override
        public void run() {
            int max = LargeIntArray.max(array, start, end);
            synchronized (results) { // plusieurs activités pourraient finir simultanément => exclusion mutuelle nécessaire
                results.add(max);
            }
        }
    }

    /** Le tableau est découpé en numberOfThreads tronçons, chacun traité par un thread. */
    private static int computeMax(int[] array, int numberOfThreads) throws InterruptedException {
        int taskSize = Math.max(1, array.length / numberOfThreads); // nb d'éléments traîtés par une activité
        Set<Thread> threads = new HashSet<>();
        List<Integer> results = new LinkedList<>();

        // Démarrer les activités
        // Le traitement du tableau est décomposé en segement de taille taskSize : [0..taskSize[, [taskSize..2*taskSize[ etc
        // et une activité est créée pour traiter chaque segment.
        // On fera attention que la taille du tableau n'est pas nécessairement un multiple de taskSize : le dernier segment peut être plus court (utiliser Math.min(..., array.length)).
        
        for (int i = 0; i < numberOfThreads; i++) {
            PartialMax partialMaxI = new PartialMax(array, i*taskSize, Math.min(taskSize*(1+i),array.length)-1, results);
            Thread t = new Thread(partialMaxI);
            threads.add(t);
            t.start();
        }

        // Attendre la terminaison des activités
        for (Thread t : threads){
            t.join();
        }

        // Récupérer les résultats et les fusionner
        int max = 0;
        for (Integer r : results) {
            max = Math.max(r, max);
        }
        return max;
    }
    
    public static void main(String[] args) throws Exception {
        String usage = "\nUsage : MaxTabThread <fichier> <nb essais> <nb thread>\n";
        if (args.length != 3)
          throw new IllegalArgumentException(usage);
            
        String filename = args[0];
        int nbruns = Integer.parseInt (args[1]);
        int numberOfThreads = Integer.parseInt (args[2]);
        if (nbruns < 5)
          System.out.println("Warning: résultats peu significatifs avec moins de 5 essais.");

        int[] array = LargeIntArray.load(filename);

        Benchmark benchmark = new Benchmark();
        benchmark.runExperiments(nbruns, () -> computeMax(array, numberOfThreads));
    }
}
