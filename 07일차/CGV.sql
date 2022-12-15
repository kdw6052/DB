CREATE TABLE `cinema` (
	`ci_num`	int auto_increment	NOT NULL,
	`ci_name`	varchar(50)	NULL,
	`ci_info`	longtext	NULL,
	`ci_numbers`	int not null	NULL
);

CREATE TABLE `screen_info` (
	`si_num`	int auto_increment	NOT NULL,
	`si_letf_amount`	int not null	NULL,
	`si_date`	datetime not null	NULL,
	`si_ci_num`	int not null	NOT NULL,
	`si_mv_num`	int auto_increment	NOT NULL
);

CREATE TABLE `movie` (
	`mv_num`	int auto_increment	NOT NULL,
	`mv_name`	varchar(15) not null	NULL,
	`mv_contents`	longtext  not null	NULL,
	`mv_price`	int not null	NULL
);

CREATE TABLE `review` (
	`re_num`	int auto_increment	NOT NULL,
	`re_contents`	longtext not null	NULL,
	`re_mv_num`	int auto_increment	NOT NULL,
	`re_md_num`	int not null	NOT NULL
);

CREATE TABLE `member` (
	`md_num`	int auto_increment	NOT NULL,
	`mb_id`	varchar(15)	NULL
);

CREATE TABLE `screen_date` (
	`sd_num`	int auto_increment	NOT NULL,
	`sd_date`	datetime not null	NULL,
	`sd_ci_num`	int not null	NOT NULL,
	`sd_si_num`	int not null	NOT NULL
);

CREATE TABLE `screen_time` (
	`st_num`	int auto_increment	NOT NULL,
	`st_time`	datetime not null	NULL,
	`st_amount`	int not null	NULL,
	`st_sd_num`	int not null	NOT NULL
);

CREATE TABLE `tiketing` (
	`ti_num`	int auto_increment	NOT NULL,
	`ti_amount`	int not null	NULL,
	`ti_total_price`	int not null default 0	NULL,
	`ti_st_num`	int not null	NOT NULL,
	`ti_mv_num`	int not null	NOT NULL,
	`ti_md_num`	int not null	NOT NULL
);

ALTER TABLE `cinema` ADD CONSTRAINT `PK_CINEMA` PRIMARY KEY (
	`ci_num`
);

ALTER TABLE `screen_info` ADD CONSTRAINT `PK_SCREEN_INFO` PRIMARY KEY (
	`si_num`
);

ALTER TABLE `movie` ADD CONSTRAINT `PK_MOVIE` PRIMARY KEY (
	`mv_num`
);

ALTER TABLE `review` ADD CONSTRAINT `PK_REVIEW` PRIMARY KEY (
	`re_num`
);

ALTER TABLE `member` ADD CONSTRAINT `PK_MEMBER` PRIMARY KEY (
	`md_num`
);

ALTER TABLE `screen_date` ADD CONSTRAINT `PK_SCREEN_DATE` PRIMARY KEY (
	`sd_num`
);

ALTER TABLE `screen_time` ADD CONSTRAINT `PK_SCREEN_TIME` PRIMARY KEY (
	`st_num`
);

ALTER TABLE `tiketing` ADD CONSTRAINT `PK_TIKETING` PRIMARY KEY (
	`ti_num`
);

