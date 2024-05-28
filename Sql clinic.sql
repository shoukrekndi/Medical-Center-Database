use clinic_center;
Go


CREATE TABLE [Clinic] (
  [clinic_id] int primary key ,
  [clinic_name] nvarchar(50) not null,
  [clink_floor] nvarchar(10)not null
);

CREATE INDEX [Pk] ON  [Clinic] ([clinic_id]);

CREATE TABLE [Insurance.company] (
  [inc_id] int primary key ,
  [inc_name] nvarchar(50)not null,
  [inc_address] nvarchar(50)not null,
  [inc_mobile] nvarchar(20)not null,
  [inc_state] nvarchar(10)not null,
  [clinic_id] int,
  CONSTRAINT [FK_Insurance.company.clinic_id]
    FOREIGN KEY ([clinic_id])
      REFERENCES [Clinic]([clinic_id])
);

CREATE INDEX [pk] ON  [Insurance.company] ([inc_id]);

CREATE INDEX [fk] ON  [Insurance.company] ([clinic_id]);

CREATE TABLE [Insurance card] (
  [card_id] int primary key,
  [card_name] nvarchar(50)not null,
  [card_date] date not null,
  [card_state] nvarchar(10)not null,
  [card_rate] nvarchar(10)not null,
  [card_note] nvarchar(75),
  [inc_id] int,
  CONSTRAINT [FK_Insurance card.inc_id]
    FOREIGN KEY ([inc_id])
      REFERENCES [Insurance.company]([inc_id])
);

CREATE INDEX [pk] ON  [Insurance card] ([card_id]);

CREATE INDEX [fk] ON  [Insurance card] ([inc_id]);

CREATE TABLE [Pation] (
  [pation_id] int primary key,
  [pation_f_name] nvarchar(15)not null,
  [pation_s_name] nvarchar(15)not null,
  [pation_l_name] nvarchar(15)not null,
  [pation_birthday] date not null,
  [pation_gender] nvarchar(10)not null,
  [pation_mobile] nvarchar(30)not null,
  [pation_address] nvarchar(50)not null,
  [pation_card_save] nvarchar(5)not null,
  [card_id] int,
  [clinic_id] int,
  CONSTRAINT [FK_Pation.clinic_id]
    FOREIGN KEY ([clinic_id])
      REFERENCES [Clinic]([clinic_id]),
  CONSTRAINT [FK_Pation.card_id]
    FOREIGN KEY ([card_id])
      REFERENCES [Insurance card]([card_id])
);

CREATE INDEX [pk] ON  [Pation] ([pation_id]);

CREATE INDEX [fk] ON  [Pation] ([card_id], [clinic_id]);

CREATE TABLE [Diagnosis] (
  [diagn_id] int primary key ,
  [diagn_name] nvarchar(50)not null,
  [diagn_type] nvarchar(50)not null,
  [diagn_note] nvarchar(75),
  [clinic_id] int,
  CONSTRAINT [FK_Diagnosis.clinic_id]
    FOREIGN KEY ([clinic_id])
      REFERENCES [Clinic]([clinic_id])
);

CREATE INDEX [pk] ON  [Diagnosis] ([diagn_id]);

CREATE INDEX [fk] ON  [Diagnosis] ([clinic_id]);

CREATE TABLE [Indoor survices] (
  [insur_id] int primary key,
  [insur_name] nvarchar(50)not null,
  [insur_type] nvarchar(25)not null,
  [insur_price] nvarchar(20)not null,
  [insur_note] nvarchar(75),
  [clinic_id] int,
  CONSTRAINT [FK_Indoor survices.clinic_id]
    FOREIGN KEY ([clinic_id])
      REFERENCES [Clinic]([clinic_id])
);

CREATE INDEX [pk] ON  [Indoor survices] ([insur_id]);

CREATE INDEX [fk] ON  [Indoor survices] ([clinic_id]);

CREATE TABLE [Indoor service details] (
  [insurlis_id] int primary key,
  [insurlis_name] nvarchar(50),
  [insurlis_date] date ,
  [insurlis_type] nvarchar(50),
  [insurlis_price] nvarchar(20),
  [insurlis_note] nvarchar(75),
  [insur_id] int,
  [clinc_id] int,
  CONSTRAINT [FK_Indoor service details.clinc_id]
    FOREIGN KEY ([clinc_id])
      REFERENCES [Clinic]([clinic_id]),
  CONSTRAINT [FK_Indoor service details.insur_id]
    FOREIGN KEY ([insur_id])
      REFERENCES [Indoor survices]([insur_id])
);

CREATE INDEX [pk] ON  [Indoor service details] ([insurlis_id]);

CREATE INDEX [fk] ON  [Indoor service details] ([insur_id], [clinc_id]);

CREATE TABLE [University] (
  [university_id] int primary key,
  [university_name] nvarchar(50),
  [university_date] date ,
  [university_president] nvarchar(50),
  [university_location] nvarchar(50),
  [university_link] nvarchar(50)
);

CREATE INDEX [pk] ON  [University] ([university_id]);

CREATE TABLE [Specialization] (
  [specializ_id] int primary key,
  [specializ_name] nvarchar(50),
  [specializ_graduation date] date,
  [specializ_appreciation] nvarchar(50),
  [university_id] int,
  CONSTRAINT [FK_Specialization.university_id]
    FOREIGN KEY ([university_id])
      REFERENCES [University]([university_id])
);

CREATE INDEX [pk] ON  [Specialization] ([specializ_id]);

CREATE INDEX [fk] ON  [Specialization] ([university_id]);


CREATE TABLE [Doctor] (
  [doctor_id] int primary key,
  [doctor_name] nvarchar(50),
  [specializ_id] int,
  [doctor_expert] nvarchar(50),
  [doctor_birthday] date,
  [doctor_mobile] nvarchar(20),
  [doctor_address] nvarchar(50),
  [clinic_id] int,
  CONSTRAINT [FK_Doctor.specializ_id]
    FOREIGN KEY ([specializ_id])
      REFERENCES [Specialization]([specializ_id]),
  CONSTRAINT [FK_Doctor.clinic_id]
    FOREIGN KEY ([clinic_id])
      REFERENCES [Clinic]([clinic_id])
);

CREATE INDEX [Pk] ON  [Doctor] ([doctor_id]);

CREATE INDEX [fk] ON  [Doctor] ([specializ_id], [clinic_id]);

CREATE TABLE [Dosage] (
  [dosage_id] int primary key,
  [dosage_name] nvarchar(50),
  [dosage_amount] nvarchar(25),
  [dosage_nu times] nvarchar(25),
  [dosage_type] nvarchar(50),
  [dosage_size] nvarchar(25),
  [dosage_note] nvarchar(75),
  [clinic_id] int,
  CONSTRAINT [FK_Dosage.clinic_id]
    FOREIGN KEY ([clinic_id])
      REFERENCES [Clinic]([clinic_id])
);

CREATE INDEX [pk] ON  [Dosage] ([dosage_id]);

CREATE INDEX [fk] ON  [Dosage] ([clinic_id]);

CREATE TABLE [Medicine] (
  [med_id] int primary key,
  [med_name] nvarchar(50),
  [med_scien_name] nvarchar(50),
  [med_price] nvarchar(20),
  [clinic_id] int,
  CONSTRAINT [FK_Medicine.clinic_id]
    FOREIGN KEY ([clinic_id])
      REFERENCES [Clinic]([clinic_id])
);

CREATE INDEX [pk] ON  [Medicine] ([med_id]);

CREATE INDEX [fk] ON  [Medicine] ([clinic_id]);

CREATE TABLE [Medical List] (
  [medlist_id] int primary key,
  [medlist_name] nvarchar(50),
  [medlist_date] date,
  [medlist_time] nvarchar(10),
  [med_id] int,
  [dosage_id] int,
  [pation_id] int,
  CONSTRAINT [FK_Medical List.pation_id]
    FOREIGN KEY ([pation_id])
      REFERENCES [Pation]([pation_id]),
  CONSTRAINT [FK_Medical List.dosage_id]
    FOREIGN KEY ([dosage_id])
      REFERENCES [Dosage]([dosage_id]),
  CONSTRAINT [FK_Medical List.med_id]
    FOREIGN KEY ([med_id])
      REFERENCES [Medicine]([med_id])
);

CREATE INDEX [pk] ON  [Medical List] ([medlist_id]);

CREATE INDEX [fk] ON  [Medical List] ([med_id], [dosage_id], [pation_id]);

CREATE TABLE [Appointments] (
  [apo_id] int primary key,
  [apo_date] date,
  [apo_time] nvarchar(20),
  [apo_note] nvarchar(75),
  [clinic_id] int,
  [pation_id] int,
  CONSTRAINT [FK_Appointments.clinic_id]
    FOREIGN KEY ([clinic_id])
      REFERENCES [Clinic]([clinic_id]),
  CONSTRAINT [FK_Appointments.pation_id]
    FOREIGN KEY ([pation_id])
      REFERENCES [Pation]([pation_id])
);

CREATE INDEX [pk] ON  [Appointments] ([apo_id]);

CREATE INDEX [fk] ON  [Appointments] ([clinic_id], [pation_id]);

CREATE TABLE [Visit] (
  [visit_id] int primary key,
  [visit_date] date,
  [visit_time] nvarchar(20),
  [visit_type] nvarchar(50),
  [pation_id] int,
  [clinic_id] int,
  [doctor_id] int,
  [apo_id] int,
  [medlist_id] int,
  [insurlis_id] int,
  CONSTRAINT [FK_Visit.doctor_id]
    FOREIGN KEY ([doctor_id])
      REFERENCES [Doctor]([doctor_id]),
  CONSTRAINT [FK_Visit.medlist_id]
    FOREIGN KEY ([medlist_id])
      REFERENCES [Medical List]([medlist_id]),
  CONSTRAINT [FK_Visit.pation_id]
    FOREIGN KEY ([pation_id])
      REFERENCES [Pation]([pation_id]),
  CONSTRAINT [FK_Visit.apo_id]
    FOREIGN KEY ([apo_id])
      REFERENCES [Appointments]([apo_id]),
  CONSTRAINT [FK_Visit.insurlis_id]
    FOREIGN KEY ([insurlis_id])
      REFERENCES [Indoor service details]([insurlis_id]),
  CONSTRAINT [FK_Visit.clinic_id]
    FOREIGN KEY ([clinic_id])
      REFERENCES [Clinic]([clinic_id])
);

CREATE INDEX [pk] ON  [Visit] ([visit_id]);

CREATE INDEX [fk] ON  [Visit] ([pation_id], [clinic_id], [doctor_id], [apo_id], [medlist_id], [insurlis_id]);

CREATE TABLE [medical check request] (
  [medchreq_id] int primary key,
  [medchreq_name] nvarchar(50),
  [medchreq_date] date,
  [medchreq_time] nvarchar(30),
  [medchreq_result] nvarchar(50),
  [medchreq_note] nvarchar(75),
  [clinic_id] int,
  [visit_id] int,
  CONSTRAINT [FK_medical check request.clinic_id]
    FOREIGN KEY ([clinic_id])
      REFERENCES [Clinic]([clinic_id]),
  CONSTRAINT [FK_medical check request.visit_id]
    FOREIGN KEY ([visit_id])
      REFERENCES [Visit]([visit_id])
);

CREATE INDEX [pk] ON  [medical check request] ([medchreq_id]);

CREATE INDEX [fk] ON  [medical check request] ([clinic_id], [visit_id]);

CREATE TABLE [Medical check] (
  [medcheck_id] int primary key,
  [medcheck_name] nvarchar(50),
  [medcheck_type] nvarchar(50),
  [medcheck_price] nvarchar(20),
  [medcheck_note] nvarchar(75),
  [clinic_id] int,
  CONSTRAINT [FK_Medical check.clinic_id]
    FOREIGN KEY ([clinic_id])
      REFERENCES [Clinic]([clinic_id])
);

CREATE INDEX [pk] ON  [Medical check] ([medcheck_id]);

CREATE INDEX [fk] ON  [Medical check] ([clinic_id]);

CREATE TABLE [Bank] (
  [bank_id] int primary key,
  [bank_name] nvarchar(70),
  [bank_address] nvarchar(50),
  [bank_link] nvarchar(50),
  [bank_mobile] nvarchar(30),
  [bank_state] nvarchar(10)
);

CREATE INDEX [pk] ON  [Bank] ([bank_id]);

CREATE TABLE [credit card] (
  [credit card_id] int primary key,
  [credit card_name] nvarchar(50),
  [credit card_date] date,
  [credit card_state] nvarchar(10),
  [bank_id] int,
  CONSTRAINT [FK_credit card.bank_id]
    FOREIGN KEY ([bank_id])
      REFERENCES [Bank]([bank_id])
);

CREATE INDEX [pk] ON  [credit card] ([credit card_id]);

CREATE INDEX [fk] ON  [credit card] ([bank_id]);

CREATE TABLE [Pay] (
  [pay_id] int primary key,
  [medlist_id] int,
  [insurlis_id] int,
  [medchreq_id] int,
  [credit card_id] int,
  CONSTRAINT [FK_Pay.insurlis_id]
    FOREIGN KEY ([insurlis_id])
      REFERENCES [Indoor service details]([insurlis_id]),
  CONSTRAINT [FK_Pay.medchreq_id]
    FOREIGN KEY ([medchreq_id])
      REFERENCES [medical check request]([medchreq_id]),
  CONSTRAINT [FK_Pay.medlist_id]
    FOREIGN KEY ([medlist_id])
      REFERENCES [Medical List]([medlist_id]),
  CONSTRAINT [FK_Pay.credit card_id]
    FOREIGN KEY ([credit card_id])
      REFERENCES [credit card]([credit card_id])
);

CREATE INDEX [pk] ON  [Pay] ([pay_id]);

CREATE INDEX [fk] ON  [Pay] ([medlist_id], [insurlis_id], [medchreq_id], [credit card_id]);

CREATE TABLE [User] (
  [user_id] int primary key,
  [user_name] nvarchar(50),
  [user_password] nvarchar(15),
  [user_type] nvarchar(20),
  [clinc_id] int,
  CONSTRAINT [FK_User.clinc_id]
    FOREIGN KEY ([clinc_id])
      REFERENCES [Clinic]([clinic_id])
);

CREATE INDEX [pk] ON  [User] ([user_id]);

CREATE INDEX [fk] ON  [User] ([clinc_id]);

CREATE TABLE [Make a diagnosis] (
  [makedia_id] int primary key,
  [makedia_name] nvarchar(50),
  [makedia_date] date,
  [makedia_time] nvarchar(50),
  [diagn_id] int,
  [visit_id] int,
  [clinic_id] int,
  CONSTRAINT [FK_Make a diagnosis.diagn_id]
    FOREIGN KEY ([diagn_id])
      REFERENCES [Diagnosis]([diagn_id]),
  CONSTRAINT [FK_Make a diagnosis.clinic_id]
    FOREIGN KEY ([clinic_id])
      REFERENCES [Clinic]([clinic_id]),
  CONSTRAINT [FK_Make a diagnosis.visit_id]
    FOREIGN KEY ([visit_id])
      REFERENCES [Visit]([visit_id])
);

CREATE INDEX [pk] ON  [Make a diagnosis] ([makedia_id]);

CREATE INDEX [fk] ON  [Make a diagnosis] ([diagn_id], [visit_id], [clinic_id]);

