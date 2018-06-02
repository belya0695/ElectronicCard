insert into [EC.DB].dbo.posts (post_name)
values ('Lorem'), ('Nullam'), ('Morbi'), ('Class'), ('Aenean'), ('Nostra'), ('Cras'), ('Bibendum'), ('Ante')

insert into [EC.DB].dbo.drugs (drug_name)
values ('Ipsum'), ('Vulputate'), ('Porttitor'), ('Facilisis'), ('Molestie'), ('Commodo'), ('Aptent'), ('Inceptos'), ('Rhoncus')

insert into [EC.DB].dbo.medical_procedures (procedure_name)
values ('Sociosqu'), ('Elementum'), ('lectus'), ('metus'), ('sem')

INSERT INTO [EC.DB].dbo.diagnoses (diagnosis_name)
values ('Pellentesque'), ('ullamcorper'), ('semper'), ('consectetur'), ('Donec'), ('non')

insert into [EC.DB].dbo.roles (role_name)
values ('admin'), ('editor'), ('doctor'), ('patient')

INSERT INTO [dbo].[users]([first_name],[middle_name],[last_name],[post_id],[birthdate],[email])
VALUES ('Jarrod','Moon','Adam',5,'19/01/1954','tempus.risus.Donec@litoratorquent.ca'),('Yuli','Nash','Tiger',3,'13/04/1967','Vestibulum.ut@volutpatNulla.edu'),('Meredith','Shaffer','Lamar',9,'11/11/1969','mus.Aenean.eget@enim.ca'),('Reed','Gross','John',5,'07/01/1976','risus.Duis@diam.ca'),('Keefe','Craig','Forrest',5,'21/04/1965','venenatis.a@nislMaecenas.com'),
('Admin','Admin','Admin',5,'19/01/1954','Admin@admin.ca'),
('Editor','Editor','Editor',3,'13/04/1967','Editor@editor.ed')
INSERT INTO [dbo].[users]([first_name],[middle_name],[last_name],[post_id],[birthdate],[email],[workplace])
VALUES ('Zelenia','Morris','Addison',3,'02/03/1982','lectus.quis@cursus.co.uk','Nulla Limited'),('Allistair','Moore','Vincent',4,'18/06/1976','et.netus@ipsumCurabitur.ca','Ut Nec Inc.'),('Paki','Cox','Daniel',3,'13/08/1953','non.sapien@Sedmalesuada.net','Nostra Per Associates'),('Amaya','Page','Felix',2,'14/01/1969','magnis.dis.parturient@vitae.ca','Pharetra Inc.'),('Raven','Shaw','Zeus',7,'03/04/1980','Vivamus.rhoncus@eu.edu','Nisi Institute')

INSERT INTO [dbo].[logins]([login],[pass],[user_id],[role_id])
VALUES ('doc1', '1111', 1, 3),('doc2', '1111', 2, 3),('doc3', '1111', 3, 3),('doc4', '1111', 4, 3),('doc5', '1111', 5, 3),
('editor1', '0000', 6, 2),
('admin1', '0000', 7, 1),
('pat1', '2222', 8, 4),('pat2', '2222', 9, 4),('pat3', '2222', 10, 4),('pat4', '2222', 11, 4),('pat5', '2222', 12, 4)

INSERT INTO [dbo].[users_phones]([user_id],[phone_number])
VALUES (1,'3696727484'),(2,'1717972601'),(3,'8041816590'),(4,'1437291720'),(5,'3719706085'),(6,'8747398222'),(7,'5753427985'),(8,'5289436892'),(9,'8691923251'),(10,'3371912293'),(11,'8679460343'),(12,'6157386900')

INSERT INTO [EC.DB].dbo.sick_leaves (issued, valid_from, valid_to)
values(1,'06/05/2018','12/05/2018'),(1,'06/05/2018','11/05/2018'),(1,'03/05/2018','11/05/2018'),(1,'01/05/2018','07/05/2018'),(1,'05/05/2018','12/05/2018'),(1,'12/05/2018','16/05/2018'),(1,'14/05/2018','15/05/2018'),(1,'27/05/2018','30/05/2018')

INSERT INTO [EC.DB].dbo.medical_records (record_date, patient_id, diagnosis_id, doctor_id, sick_leave_id)
values ('05/05/2018',8,1,1,1),('04/05/2018',9,2,2,2),('04/05/2018',10,3,3,3),('03/05/2018',11,4,4,4),('01/05/2018',12,5,5,5),
('12/05/2018',8,6,1,6),('14/05/2018',8,1,1,7),('27/05/2018',8,1,1,8)

INSERT INTO [EC.DB].dbo.grugs_lists (record_id, drug_id, administration_mode, treatment_duration)
values (1,1,'in lobortis tellus justo sit',27),(1,2,'vitae velit egestas lacinia.',15),(3,3,'lobortis mauris. Suspendisse aliquet molestie',19),
(4,4,'sit amet ante. Vivamus',28),(5,5,'est. Nunc laoreet lectus quis massa.',19),
(6,6,'sit amet ante. Vivamus non',3),(7,9,'elit sed consequat auctor,',5),(8,9,'Aenean euismod mauris eu',1)

INSERT INTO [EC.DB].dbo.procedures_lists (record_id, procedure_id, administration_mode, treatment_duration)
values (1,1,'sit amet, dapibus id,',9),(2,2,'natoque penatibus et magnis dis',8),(3,3,'Nam interdum enim non',8),
(4,4,'velit. Aliquam nisl. Nulla eu',7),(5,5,'rhoncus. Proin nisl',6),
(6,1,'enim. Nunc ut erat. Sed nunc',14),(7,2,'tempor arcu. Vestibulum ut eros',6),(8,1,'risus. Donec egestas. Duis ac arcu.',14)