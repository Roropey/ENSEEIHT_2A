-- Time-stamp: <08 nov 2019 20:01 queinnec@enseeiht.fr>

with LR.Synchro.Basique;
with LR.Synchro.Exclusion;
-- with LR.Synchro.Toto;  -- XXXX

package body LR.Synchro is
   
   package Synchro renames LR.Synchro.Exclusion; -- XXXX
   
   function Nom_Strategie return String renames Synchro.Nom_Strategie;

   procedure Demander_Lecture renames Synchro.Demander_Lecture;

   procedure Demander_Ecriture renames Synchro.Demander_Ecriture;

   procedure Terminer_Lecture renames Synchro.Terminer_Lecture;

   procedure Terminer_Ecriture renames Synchro.Terminer_Ecriture;

end LR.Synchro;
