insert into [EC.DB].dbo.posts (post_name)
values ('Lorem'), ('Nullam'), ('Morbi'), ('Class'), ('Aenean'), ('Nostra'), ('Cras'), ('Bibendum'), ('Ante')

insert into [EC.DB].dbo.drugs (drug_name)
values ('Ipsum'), ('Vulputate'), ('Porttitor'), ('Facilisis'), ('Molestie'), ('Commodo'), ('Aptent'), ('Inceptos'), ('Rhoncus')

insert into [EC.DB].dbo.medical_procedures (procedure_name)
values ('Sociosqu'), ('Elementum'), ('lectus'), ('metus'), ('sem')

INSERT INTO [EC.DB].dbo.diagnoses (diagnosis_name)
values ('Pellentesque'), ('ullamcorper'), ('semper'), ('consectetur'), ('Donec'), ('non')

INSERT INTO [EC.DB].dbo.patients(first_name, middle_name, last_name, birthdate, workplace)
values ('Cadman','Kasper','Aaron','21/01/1970','Libero Morbi Accumsan Institute'),('Thor','Hayden','Paki','21/05/1976','Nunc Ut Company'),('Kieran','Channing','Amir','26/12/1980','Duis Incorporated'),('Keegan','Preston','Ria','09/04/1968','Duis Elementum Dui PC'),('Hoyt','Blake','Rebecca','15/02/1967','Enim Foundation'),('Willa','Grant','Zachery','17/09/1991','Ac Corporation'),('Oleg','Steven','Skyler','12/03/1964','Integer Limited'),('Judith','Talon','Yvette','26/08/1966','Ultrices Mauris Ipsum Inc.'),('Otto','Ulric','Unity','24/11/1954','Volutpat Nunc Industries'),('Eaton','Omar','Harding','24/08/1946','Sed Nunc Est LLP'),('Angelica','Rudyard','Audrey','23/09/1962','Sit Limited'),('Kalia','Jared','Reed','17/05/1966','Lectus Rutrum Institute'),('Leroy','Garth','Shea','06/08/1978','Consequat Dolor Corporation'),('Lionel','Hilel','Joseph','08/04/1966','Ut Nulla Company'),('Madison','Chaney','Hu','18/08/1984','Nonummy Fusce Fermentum Corporation'),('Jordan','Alan','Hector','08/06/1962','Ac Mattis Industries'),('Curran','August','Victor','05/09/1948','Cursus Institute'),('Shad','Ulysses','Wilma','15/04/1989','Diam Nunc Corporation'),('Paula','Mason','Anne','25/08/1988','Id Ltd'),('Naida','Barclay','Ruth','28/09/1966','Nisi Sem Semper Inc.'),('Owen','Christian','Kirk','26/05/1980','Pellentesque A Company'),('Colorado','Hakeem','Carolyn','16/09/1944','Amet Luctus Vulputate Incorporated'),('Evan','Alec','Joelle','20/07/1989','Diam Eu Dolor Limited'),('Josiah','Daquan','Lance','01/05/1959','Suspendisse Institute'),('Lenore','Declan','Dante','29/06/1957','Lacinia At Incorporated'),('Aphrodite','Ross','Minerva','23/05/1966','Vitae Mauris Ltd'),('Hillary','Elijah','Wynne','21/11/1977','Orci Ut Semper Company'),('Doris','Nash','Louis','17/10/1937','Suspendisse Sed Company'),('Cheyenne','Lionel','Cameron','13/05/1978','Iaculis Nec LLC'),('Neville','Harlan','Lucian','23/01/1986','Accumsan Interdum Libero Foundation');

INSERT INTO [EC.DB].dbo.doctors(first_name, middle_name, last_name, post_id)
values ('Hadassah','Alan','Madeline',1),('Chancellor','Dennis','Dacey',2),('Roth','Calvin','Cullen',3),('Timon','Donovan','Dominic',4),('Hyacinth','Oleg','Kasimir',5),('Taylor','Samson','Jena',6),('Emerson','Arsenio','Raymond',7),('Hillary','Marsden','Mannix',8),('Honorato','Wayne','Rebekah',9),('Isaiah','Cain','Yuri',1)

INSERT INTO [EC.DB].dbo.patients_phones(patient_id, phone_number)
values(1,'328257322'),(2,'042904986'),(3,'734040225'),(4,'537581455'),(5,'901701536'),(6,'545504606'),(7,'713849681'),(8,'385457102'),(9,'394014936'),(10,'522935369'),(11,'781853052'),(12,'530738833'),(13,'039695595'),(14,'876460625'),(15,'485601509'),(16,'817789565'),(17,'386789797'),(18,'667841932'),(19,'305628722'),(20,'474681865'),(21,'961649864'),(22,'348269745'),(23,'129828219'),(24,'034988289'),(25,'813228555'),(26,'084343063'),(27,'357769834'),(28,'407623079'),(29,'230176873'),(30,'657634977')

INSERT INTO [EC.DB].dbo.doctors_phones(doctor_id, phone_number)
values(2,'932803609'),(3,'394986294'),(4,'025795164'),(5,'796747468'),(6,'726615368'),(7,'008420471'),(8,'306084023'),(9,'805014996'),(10,'914629858'),(1,'010495899')

INSERT INTO [EC.DB].dbo.sick_leaves (issued, valid_from, valid_to)
values(1,'06/05/2018','12/05/2018'),(1,'06/05/2018','11/05/2018'),(1,'03/05/2018','11/05/2018'),(1,'01/05/2018','07/05/2018'),(1,'05/05/2018','12/05/2018'),(1,'02/05/2018','11/05/2018'),(1,'02/05/2018','12/05/2018'),(1,'01/05/2018','11/05/2018'),(1,'04/05/2018','08/05/2018'),(1,'04/05/2018','07/05/2018')

INSERT INTO [EC.DB].dbo.medical_records (record_date, patient_id, diagnosis_id, doctor_id, sick_leave_id)
values ('05/05/2018',11,1,6,1),('04/05/2018',13,1,9,2),('04/05/2018',15,2,3,3),('03/05/2018',17,4,8,4),('01/05/2018',19,6,10,5),('03/05/2018',21,2,7,6),('06/05/2018',23,1,1,7),('01/05/2018',25,3,9,8),('04/05/2018',27,3,10,9),('04/05/2018',29,2,5,10),
('06/05/2018',13,1,9,2),('10/05/2018',13,3,6,2),('15/05/2018',13,2,9,2)

INSERT INTO [EC.DB].dbo.grugs_lists (record_id, drug_id, administration_mode, treatment_duration)
values (3,7,'in lobortis tellus justo sit',27),(4,3,'vitae velit egestas lacinia.',15),(5,6,'lobortis mauris. Suspendisse aliquet molestie',19),(6,6,'sit amet ante. Vivamus',28),(7,1,'est. Nunc laoreet lectus quis massa.',19),(8,4,'sit amet ante. Vivamus non',13),(9,6,'elit sed consequat auctor,',13),(10,1,'Aenean euismod mauris eu',8),(11,8,'id, erat. Etiam vestibulum massa',6),(12,1,'magna a tortor. Nunc',10)

INSERT INTO [EC.DB].dbo.procedures_lists (record_id, procedure_id, administration_mode, treatment_duration)
values (3,1,'sit amet, dapibus id,',9),(4,5,'natoque penatibus et magnis dis',8),(5,1,'Nam interdum enim non',8),(6,2,'velit. Aliquam nisl. Nulla eu',7),(7,1,'rhoncus. Proin nisl',6),(8,3,'enim. Nunc ut erat. Sed nunc',14),(9,4,'tempor arcu. Vestibulum ut eros',6),(10,1,'risus. Donec egestas. Duis ac arcu.',14),(11,5,'pellentesque, tellus sem mollis dui, in',4),(12,4,'nulla. Donec non justo. Proin',7)