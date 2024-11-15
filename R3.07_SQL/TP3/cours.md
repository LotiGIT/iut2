# Totalité 

Soit A, B, C des ensembles. C = A union B. C - (A union B) = NULL. (A union B) - C = NULL.

# Exclusion 

Soit A et B deux ensembles n'ayant rien en commun.


# Partition 

Soit A, B, C des ensembles où (A union B) - C = NULL. A ∩ B = NULL. C = A union B.



## Transaction

``` sql
START TRANSACTION
    INSERT INTO _document --<----- déclancher le trigger contrainte 
    INSERT INTO _post
COMMIT; --<-------- éxecution de la fonction trigger

CREATE CONSTRAINT TRIGGER tg_partition
AFTER INSERT
ON _document
DEFERRABLE INITIALLY DEFFERED
FOR EACH ROW
EXECUTE PROCEDURE ftg_partition();
```