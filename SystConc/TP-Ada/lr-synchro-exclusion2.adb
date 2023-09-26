-- Time-stamp: <07 nov 2022 16:26 queinnec@toulouse-inp.fr>

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Exceptions;

-- Version stupide : exclusion mutuelle de tous
package body LR.Synchro.Exclusion2 is
   
   function Nom_Strategie return String is
   begin
      return "Stupide, par exclusion mutuelle";
   end Nom_Strategie;

   task LectRedTask is
      entry Demander;
      entry Terminer;
   end LectRedTask;

   task body LectRedTask is
   begin
      loop
         accept Demander;
         accept Terminer;
         -- Ouah, que c'était dur à écrire !
      end loop;
   exception
      when Error: others =>
         Put_Line("**** LectRedTask: exception: " & Ada.Exceptions.Exception_Information(Error));
   end LectRedTask;

   procedure Demander_Lecture is
   begin
      LectRedTask.Demander;
   end Demander_Lecture;

   procedure Demander_Ecriture is
   begin
      LectRedTask.Demander;
   end Demander_Ecriture;

   procedure Terminer_Lecture is
   begin
      LectRedTask.Terminer;
   end Terminer_Lecture;

   procedure Terminer_Ecriture is
   begin
      LectRedTask.Terminer;
   end Terminer_Ecriture;

end LR.Synchro.Exclusion2;
