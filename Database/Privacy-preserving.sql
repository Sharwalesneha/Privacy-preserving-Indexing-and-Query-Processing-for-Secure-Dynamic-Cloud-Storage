/*
SQLyog - Free MySQL GUI v5.0
Host - 5.0.16-nt : Database - dynamic
*********************************************************************
Server version : 5.0.16-nt
*/


create database if not exists `dynamic`;

USE `dynamic`;

/*Table structure for table `cloud` */

DROP TABLE IF EXISTS `cloud`;

CREATE TABLE `cloud` (
  `idcloud` int(10) unsigned NOT NULL auto_increment,
  `cloudid` varchar(45) NOT NULL default '',
  `password` varchar(45) NOT NULL default '',
  PRIMARY KEY  (`idcloud`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cloud` */

insert into `cloud` values 
(1,'cloud','cloud');

/*Table structure for table `filerequest` */

DROP TABLE IF EXISTS `filerequest`;

CREATE TABLE `filerequest` (
  `fileid` int(45) NOT NULL,
  `filename` varchar(45) default NULL,
  `username` varchar(45) default NULL,
  `emailid` varchar(45) default NULL,
  `ownername` varchar(45) default NULL,
  `status` varchar(45) default NULL,
  `privatekey` varchar(45) default NULL,
  `aggrigatekey` varchar(45) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `filerequest` */

/*Table structure for table `owner` */

DROP TABLE IF EXISTS `owner`;

CREATE TABLE `owner` (
  `ownerid` int(10) unsigned NOT NULL auto_increment,
  `ownername` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `emailid` varchar(45) NOT NULL,
  `contactno` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `state` varchar(45) default NULL,
  `country` varchar(45) default NULL,
  `dob` varchar(45) default NULL,
  PRIMARY KEY  (`ownerid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `owner` */

insert into `owner` values 
(1,'anusha','anu','anusha@gmail.com','9685741245','Female','ap','india','1/2/2018'),
(3,'sangeetha','san','sangeetha.datapoint@gmail.com','9685741452','Female','ap','india','01\021996');

/*Table structure for table `shareinfo` */

DROP TABLE IF EXISTS `shareinfo`;

CREATE TABLE `shareinfo` (
  `fileid` varchar(45) default NULL,
  `filefrom` varchar(45) default NULL,
  `fileto` varchar(45) default NULL,
  `index1` varchar(45) default NULL,
  `filename` varchar(45) default NULL,
  `privatekey` varchar(45) default NULL,
  `status` varchar(45) default NULL,
  `emailid` varchar(45) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `shareinfo` */

/*Table structure for table `tp` */

DROP TABLE IF EXISTS `tp`;

CREATE TABLE `tp` (
  `idtp` int(10) unsigned NOT NULL auto_increment,
  `tpid` varchar(45) NOT NULL default '',
  `password` varchar(45) NOT NULL default '',
  PRIMARY KEY  (`idtp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tp` */

insert into `tp` values 
(1,'tpa','tpa');

/*Table structure for table `upload` */

DROP TABLE IF EXISTS `upload`;

CREATE TABLE `upload` (
  `fileid` int(45) NOT NULL auto_increment,
  `ownerid` int(45) default NULL,
  `index1` varchar(45) default NULL,
  `ownername` varchar(45) default NULL,
  `emailid` varchar(45) default NULL,
  `file` longblob,
  `cipherdata` longblob,
  `filename` varchar(45) default NULL,
  `privatekey` varchar(45) default NULL,
  PRIMARY KEY  (`fileid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `upload` */

insert into `upload` values 
(2,1,'123','anusha','anusha@gmail.com','2) EXAM SECTION:\n\nÿ  Class wise Examination Setup\n\nÿ  Grades/ Marks Setup\n\nÿ  Examination setup\n\nÿ  Final Assessment/ or Report card\n\nÿ  Informing Parents about results through email, SMS, or letter\n\nÿ  Defining Marks\n\n\n\n\n\n\ni). Class wise Examination Setup\n\n Institute can setup exams class wise, like what all subject to be included in a particular class along with grades or marks.\n\nii). Grades/ Marks Setup\n\n To declare the result either on grading system and grades can be defined on the basis of percentile, say 96%-100%, will come under A+ grade and 33%-38% will come under E grade.\n\niii). Examination setup\n\nExamination held during a session; class test, the mid-term examination, Lab internal and external examinations. This module will define particular dates allotted for each and every subject. Defining different subjects for different classes and further defining in academic and non-academic, compulsory, optional and additional, theoretical and practical papers, etc. with their codes.\n\niv). Final Assessment/ or Report card\n\nResult sheet depicts studentís performance throughout the academic session and for staff management, it will make easier for teachers show a graphical representation of studentís performance by maintaining academic or examination records.\n\nv). Informing Parents about results through email, SMS, or letter\n\nCollege management to send the result by SMS, Email or Letter to Parents as this is beneficial for parents to get to know about their studentís performance and ability by even performing in daily activities.\n\nvi). Defining Marks\n\nYou can define Maximum Marks and Passing Marks for different examination and subjects.\n\n\n\n\n\ndeniable:\n\n\nPut differently, \"clandestine\" means hidden, while \"covert\" means deniable. ... Deniable encryption\n allows its users to decrypt the ciphertext to produce a different (innocuous but plausible) plaintext and insist that it is what they encrypted.\n\naudit :\n\nAn audit is a systematic and independent examination of books, accounts, statutory records, documents and vouchers of an organization to ascertain how far the financial statements as well as non-financial disclosures present a true and fair view of the concern.\n\nfree:\n\nfree is a open source platform\n\nAttribute-based encryption:\n\nAttribute-based encryption is a type of public-key encryption in which the secret key of a user\n-------------------------------------------------------------------------------------------------------\nvirtual machine:\n\nA virtual machine (VM) is a software program or operating system that not only exhibits the behavior of a separate computer, but is also capable of performing tasks such as running applications and programs like a separate computer.\n','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\r\n','drk.txt','5atU6kfqjn1xCX7hDn'),
(3,1,'456','anusha','anusha@gmail.com','1.High Fidelity Experiment Platform for Mobile Networks\n\n2.A novel IoT platform for the era of connected cars\n\n3.Reliability-Aware Service Chaining In Carrier-Grade Softwarized Networks\n\n4.Joint Optimization of Radio and Virtual Machine Resources with Uncertain User Demands in Mobile Cloud Computing\n\n5.A Dynamic Virtual Machine Placement and Migration Scheme For Data Centers\n\n6.Joint Virtual Computing and Radio Resource Allocation in Limited Fronthaul\n Green C-RANs//ece\n\n7.Resource Optimization Across the Cloud Stack\n\n8.DROPS: Division and Replication of Data in Cloud for Optimal Performance and Security\n\n9.Impulse noise detection technique based on fuzzy set\n\n10.Audit-Free Cloud Storage via Deniable Attribute-Based Encryption\n\n11.Efficient Fine-Grained Data Sharing Mechanism for Electronic Medical Record Systems with Mobile Devices\n\n12.Learning and selecting confidence measures for robust stereo matching\n\n\n13.A Novel PMU Fog Based Early Anomaly Detection for an Efficient Wide Area PMU Network\n\n14.Fog-Based Crime-Assistance in Smart IoT Transportation System\n\n15.Routing Cost Minimization and Throughput Maximization of NFV-Enabled Unicasting in Software-Defined Networks\n\n16.Energy management strategy for hybrid power systems based on moving average filters and power forecasting\n\n17.Joint Minimization of the Energy Costs From Computing, Data Transmission, and Migrations in Cloud Data Centers\n\n18.Data-Driven Cell Zooming for Large-Scale Mobile Networks\n\n19.DRL-cloud: Deep reinforcement learning-based resource provisioning and task scheduling for cloud service providers\n\n20.An Instance Reservation Framework for Cost Effective Services in Geo-Distributed Data Centers\n','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','ieee 2018 project list.txt','UMpgXvCOXB'),
(4,3,'789','sangeetha','sangeetha.datapoint@gmail.com','1.Dynamic-Hash-Table Based Public Auditing for Secure Cloud Storage\n2.Efficient Keyword-Aware Representative Travel Route Recommendation\n3.Securing Cloud Data under Key Exposure\n4.Trajectory Community Discovery and Recommendation by Multi-source Diffusion Modeling\n5.Attribute-Based Storage Supporting Secure Deduplication of Encrypted Data in Cloud\n6.Provably Secure Key-Aggregate Cryptosystems with Broadcast Aggregate Keys for Online Data Sharing on the Cloud\n7.Mining Competitors from Large Unstructured Datasets\n8.Efficient Keyword-aware Representative Travel Route Recommendation\n9.Privacy-Preserving Selective Aggregation of Online User Behavior Data\n10.Strong Key-Exposure Resilient Auditing for Secure Cloud Storage\n11.A Classroom Scheduling Service for Smart Classes\n12.The Importance of Worker Reputation Information in Microtask-Based Crowd Work Systems\n','8NNxykv+2pa/dQgc+puOUL67nnkvUQi+3jIkQ7FH+4TrOpI8JRtnHdvFdklaBvNn1UVKc0zw8LeT\r\nKCFiTZR5699o09BkHtnCCkL9lX5P7tWXohSevQMRgZ8rCUrDJOAL7SdkOPKS7dvOhJ4sR0HMenIA\r\nu3nF02qbGwuQjqWsEi2jIwn+OvdExlDy2B5Z8q8n36jI9IhWiIzblQsXk7AW8HzWMBXMZhRVuAi/\r\nneLzAB4SMM9HYJVZCa2ug+30uxZA5F2mhauGxumOV0mSrOP/3AoE9N+9WfCimKEtBC0z4Iu4Dc4v\r\n0BrQTdKMkIkWRvb4zyJWk7s3gLrCfUwoGatsDMSIzsCzp+ubcsVAVtMgx/Ql7ix0O2+wzb9FQWR7\r\n4dH/GN/egjyOultA2r2prEJVWNQg8e0g7iJahscPh2tSv+OFaqI66mwSxo3V6bLjxpNDtUdLivQs\r\nnugldHM6R5TUZDK1HcfOtQA8CVJPn9JlHzUFD/1AYXNKtFL7YXHPFaTDGytxkfA6TEhVGvCXgVT2\r\n95m1QW6ctFol6f8NoYpxVcB9y24QWD8G3+l0gMO912tSLNDSPIY9+qlHX5FzHBEX14cJi6aVjOvq\r\nFSSwLRto0aM2U0pq+jt7xvBfN2jZCiZAIdOzMLmf1gOLhl1zRX+U5xYyj/VhwFuq9BU/y+oNyPhz\r\naYbswzVkm85Jw2zOpG1dohv7DkVRwflz2nE0paB46dOfBfCWtwzAl+a997KAW3X2YJCXctR+00E5\r\nRq0Mk5eRf6PFSJvGeOaBEbuMn4IHgGcB9wK/y9Aj8c7w+6CtOZul3GLxggB/aE4PFTyw3CZ7HLHe\r\nuAcJ7FO0Y5l1+ZZcSi5N7fGdWNcd3t9uHeC8FGbhiHyxBQFhcHLNJ5HC+U0HCQtWBA4MDKQYOrWC\r\nS/IgKoQIrpe4cOMVyivrqcRqmSbKa1hMNkyHleTdxvO3FrBC6a2OmraA/DSh7O2jPkT/sojDkc5E\r\nmXhMn+CgGA17AjzOdNCxWTNcoVKTJI7RhY4Q5m7J0OlNIdLGMbc87eETzMfR8/TD4b9hfmRwD61B\r\nBGCwdGiDibHqmbHnaVDHuSZWmg4+rQzTrTbPSVBSUYqVjcelLPpxJKOqojJMTUQmmvsIqxYrXEaT\r\nCz/I0rwBolJIwSQKOWpq3hfvRF+K8RyYlA==','dot nettitles.txt','nD7Jgel8puWrLeHe4L');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `userid` int(10) unsigned NOT NULL auto_increment,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL default '',
  `emailid` varchar(45) NOT NULL,
  `contactno` varchar(45) default NULL,
  `gender` varchar(45) NOT NULL,
  `state` varchar(45) default NULL,
  `country` varchar(45) default NULL,
  `dob` varchar(45) default NULL,
  PRIMARY KEY  (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert into `user` values 
(1,'akhila','akl','akhilakdatapoint@gmail.com','9632547812','Female','ap','india','1/2/2018');
