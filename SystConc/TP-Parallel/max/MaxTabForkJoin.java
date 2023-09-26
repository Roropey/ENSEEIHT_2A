import java.util.concurrent.RecursiveTask;
import java.util.concurrent.ForkJoinPool;
import java.util.concurrent.ExecutionException;

public class MaxTabForkJoin {

    static class PartialMax extends RecursiveTask<Integer> {
        private int start;
        private int end;
        private int[] array;
        private int threshold;

        PartialMax(int[] array, int start, int end, int threshold) {
            this.array = array;
            this.start = start;
            this.end = end;
            this.threshold = threshold;
        }

        /* Si l'intervalle à explorer est supérieur au seuil (threshold), on décompose
           en deux sous-tâches. Sinon, on utilise directement LargeIntArray.max. */
        public Integer compute() {
            if ((this.end - this.start)>threshold) {
                int mid = (end+start)/2;
                PartialMax pm1 = new PartialMax(array, start, mid,threshold);
                PartialMax pm2 = new PartialMax(array, mid + 1, end,threshold);
                pm1.fork();
                pm2.fork();
                int result = pm1.join() + pm2.join();
                return result;
            } else {
                return LargeIntArray.max(array, start, end);
            }

       }
    }
        
    private static int computeMax(ForkJoinPool fjp, int[] array, int threshold) throws InterruptedException, ExecutionException {
        PartialMax full = new PartialMax(array, 0, array.length, threshold);
        int max = fjp.invoke(full);
        return max;
    }
    
    public static void main(String[] args) throws Exception {
        String usage = "\nUsage : MaxTabForkJoin <fichier> <nb essais> <seuil>\n";
        if (args.length != 3)
          throw new IllegalArgumentException(usage);
            
        String filename = args[0];
        int nbruns = Integer.parseInt (args[1]);
        int threshold = Integer.parseInt (args[2]);
        if (nbruns < 5)
          System.out.println("Warning: résultats peu significatifs avec moins de 5 essais.");

        int[] array = LargeIntArray.load(filename);

        Benchmark benchmark = new Benchmark();

        ForkJoinPool fjp = new ForkJoinPool();
        benchmark.runExperiments(nbruns, () -> computeMax(fjp, array, threshold));
        fjp.shutdown();
    }
}
