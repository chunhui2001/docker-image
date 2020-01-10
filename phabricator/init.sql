
drop database phabricator_almanac      ;
drop database phabricator_application  ;
drop database phabricator_audit        ;
drop database phabricator_auth         ;
drop database phabricator_badges       ;
drop database phabricator_cache        ;
drop database phabricator_calendar     ;
drop database phabricator_chatlog      ;
drop database phabricator_conduit      ;
drop database phabricator_config       ;
drop database phabricator_conpherence  ;
drop database phabricator_countdown    ;
drop database phabricator_daemon       ;
drop database phabricator_dashboard    ;
drop database phabricator_differential ;
drop database phabricator_diviner      ;
drop database phabricator_doorkeeper   ;
drop database phabricator_draft        ;
drop database phabricator_drydock      ;
drop database phabricator_fact         ;
drop database phabricator_feed         ;
drop database phabricator_file         ;
drop database phabricator_flag         ;
drop database phabricator_fund         ;
drop database phabricator_harbormaster ;
drop database phabricator_herald       ;
drop database phabricator_legalpad     ;
drop database phabricator_maniphest    ;
drop database phabricator_meta_data    ;
drop database phabricator_metamta      ;
drop database phabricator_multimeter   ;
drop database phabricator_nuance       ;
drop database phabricator_oauth_server ;
drop database phabricator_owners       ;
drop database phabricator_packages     ;
drop database phabricator_passphrase   ;
drop database phabricator_paste        ;
drop database phabricator_pastebin     ;
drop database phabricator_phame        ;
drop database phabricator_phlux        ;
drop database phabricator_pholio       ;
drop database phabricator_phortune     ;
drop database phabricator_phrequent    ;
drop database phabricator_phriction    ;
drop database phabricator_phurl        ;
drop database phabricator_policy       ;
drop database phabricator_ponder       ;
drop database phabricator_project      ;
drop database phabricator_repository   ;
drop database phabricator_search       ;
drop database phabricator_slowvote     ;
drop database phabricator_spaces       ;
drop database phabricator_system       ;
drop database phabricator_token        ;
drop database phabricator_user         ;
drop database phabricator_worker       ;
drop database phabricator_xhpast       ;
drop database phabricator_xhprof       ;


### phabricator_meta_data (mysql8.0)
CREATE DATABASE phabricator_meta_data default character set utf8 collate utf8_general_ci;
Grant all privileges on phabricator_meta_data.* to 'keesh'@'%';
FLUSH PRIVILEGES;

### phabricator_almanac (mysql8.0)
CREATE DATABASE phabricator_almanac default character set utf8 collate utf8_general_ci;
Grant all privileges on phabricator_almanac.* to 'keesh'@'%';
FLUSH PRIVILEGES;

### phabricator_application (mysql8.0)
CREATE DATABASE phabricator_application default character set utf8 collate utf8_general_ci;
Grant all privileges on phabricator_application.* to 'keesh'@'%';
FLUSH PRIVILEGES;

### phabricator_audit (mysql8.0)
CREATE DATABASE phabricator_audit default character set utf8 collate utf8_general_ci;
Grant all privileges on phabricator_audit.* to 'keesh'@'%';
FLUSH PRIVILEGES;

### phabricator_auth (mysql8.0)
CREATE DATABASE phabricator_auth default character set utf8 collate utf8_general_ci;
Grant all privileges on phabricator_auth.* to 'keesh'@'%';
FLUSH PRIVILEGES;

### phabricator_badges (mysql8.0)
CREATE DATABASE phabricator_badges default character set utf8 collate utf8_general_ci;
Grant all privileges on phabricator_badges.* to 'keesh'@'%';
FLUSH PRIVILEGES;

### phabricator_cache (mysql8.0)
CREATE DATABASE phabricator_cache default character set utf8 collate utf8_general_ci;
Grant all privileges on phabricator_cache.* to 'keesh'@'%';
FLUSH PRIVILEGES;

### phabricator_cache (mysql8.0)
CREATE DATABASE phabricator_calendar default character set utf8 collate utf8_general_ci;
Grant all privileges on phabricator_calendar.* to 'keesh'@'%';
FLUSH PRIVILEGES;

### phabricator_chatlog (mysql8.0)
CREATE DATABASE phabricator_chatlog default character set utf8 collate utf8_general_ci;
Grant all privileges on phabricator_chatlog.* to 'keesh'@'%';
FLUSH PRIVILEGES;

### phabricator_conduit (mysql8.0)
CREATE DATABASE phabricator_conduit default character set utf8 collate utf8_general_ci;
Grant all privileges on phabricator_conduit.* to 'keesh'@'%';
FLUSH PRIVILEGES;

### phabricator_config (mysql8.0)
CREATE DATABASE phabricator_config default character set utf8 collate utf8_general_ci;
Grant all privileges on phabricator_config.* to 'keesh'@'%';
FLUSH PRIVILEGES;

### phabricator_conpherence (mysql8.0)
CREATE DATABASE phabricator_conpherence default character set utf8 collate utf8_general_ci;
Grant all privileges on phabricator_conpherence.* to 'keesh'@'%';
FLUSH PRIVILEGES;

### phabricator_countdown (mysql8.0)
CREATE DATABASE phabricator_countdown default character set utf8 collate utf8_general_ci;
Grant all privileges on phabricator_countdown.* to 'keesh'@'%';
FLUSH PRIVILEGES;

### phabricator_daemon (mysql8.0)
CREATE DATABASE phabricator_daemon default character set utf8 collate utf8_general_ci;
Grant all privileges on phabricator_daemon.* to 'keesh'@'%';
FLUSH PRIVILEGES;

### phabricator_dashboard (mysql8.0)
CREATE DATABASE phabricator_dashboard default character set utf8 collate utf8_general_ci;
Grant all privileges on phabricator_dashboard.* to 'keesh'@'%';
FLUSH PRIVILEGES;

### phabricator_differential (mysql8.0)
CREATE DATABASE phabricator_differential default character set utf8 collate utf8_general_ci;
Grant all privileges on phabricator_differential.* to 'keesh'@'%';
FLUSH PRIVILEGES;

### phabricator_diviner (mysql8.0)
CREATE DATABASE phabricator_diviner default character set utf8 collate utf8_general_ci;
Grant all privileges on phabricator_diviner.* to 'keesh'@'%';
FLUSH PRIVILEGES;

### phabricator_doorkeeper (mysql8.0)
CREATE DATABASE phabricator_doorkeeper default character set utf8 collate utf8_general_ci;
Grant all privileges on phabricator_doorkeeper.* to 'keesh'@'%';
FLUSH PRIVILEGES;

### phabricator_draft (mysql8.0)
CREATE DATABASE phabricator_draft default character set utf8 collate utf8_general_ci;
Grant all privileges on phabricator_draft.* to 'keesh'@'%';
FLUSH PRIVILEGES;

### phabricator_drydock (mysql8.0)
CREATE DATABASE phabricator_drydock default character set utf8 collate utf8_general_ci;
Grant all privileges on phabricator_drydock.* to 'keesh'@'%';
FLUSH PRIVILEGES;

### phabricator_fact (mysql8.0)
CREATE DATABASE phabricator_fact default character set utf8 collate utf8_general_ci;
Grant all privileges on phabricator_fact.* to 'keesh'@'%';
FLUSH PRIVILEGES;

### phabricator_feed (mysql8.0)
CREATE DATABASE phabricator_feed default character set utf8 collate utf8_general_ci;
Grant all privileges on phabricator_feed.* to 'keesh'@'%';
FLUSH PRIVILEGES;

### phabricator_file (mysql8.0)
CREATE DATABASE phabricator_file default character set utf8 collate utf8_general_ci;
Grant all privileges on phabricator_file.* to 'keesh'@'%';
FLUSH PRIVILEGES;

### phabricator_flag (mysql8.0)
CREATE DATABASE phabricator_flag default character set utf8 collate utf8_general_ci;
Grant all privileges on phabricator_flag.* to 'keesh'@'%';
FLUSH PRIVILEGES;

### phabricator_fund (mysql8.0)
CREATE DATABASE phabricator_fund default character set utf8 collate utf8_general_ci;
Grant all privileges on phabricator_fund.* to 'keesh'@'%';
FLUSH PRIVILEGES;

### phabricator_harbormaster (mysql8.0)
CREATE DATABASE phabricator_harbormaster default character set utf8 collate utf8_general_ci;
Grant all privileges on phabricator_harbormaster.* to 'keesh'@'%';
FLUSH PRIVILEGES;

### phabricator_herald (mysql8.0)
CREATE DATABASE phabricator_herald default character set utf8 collate utf8_general_ci;
Grant all privileges on phabricator_herald.* to 'keesh'@'%';
FLUSH PRIVILEGES;

### phabricator_legalpad (mysql8.0)
CREATE DATABASE phabricator_legalpad default character set utf8 collate utf8_general_ci;
Grant all privileges on phabricator_legalpad.* to 'keesh'@'%';
FLUSH PRIVILEGES;

### phabricator_maniphest (mysql8.0)
CREATE DATABASE phabricator_maniphest default character set utf8 collate utf8_general_ci;
Grant all privileges on phabricator_maniphest.* to 'keesh'@'%';
FLUSH PRIVILEGES;

### phabricator_metamta (mysql8.0)
CREATE DATABASE phabricator_metamta default character set utf8 collate utf8_general_ci;
Grant all privileges on phabricator_metamta.* to 'keesh'@'%';
FLUSH PRIVILEGES;

### phabricator_paste (mysql8.0)
CREATE DATABASE phabricator_paste default character set utf8 collate utf8_general_ci;
Grant all privileges on phabricator_paste.* to 'keesh'@'%';
FLUSH PRIVILEGES;

### phabricator_multimeter (mysql8.0)
CREATE DATABASE phabricator_multimeter default character set utf8 collate utf8_general_ci;
Grant all privileges on phabricator_multimeter.* to 'keesh'@'%';
FLUSH PRIVILEGES;

### phabricator_pastebin (mysql8.0)
CREATE DATABASE phabricator_pastebin default character set utf8 collate utf8_general_ci;
Grant all privileges on phabricator_pastebin.* to 'keesh'@'%';
FLUSH PRIVILEGES;

### phabricator_phortune (mysql8.0)
CREATE DATABASE phabricator_phortune default character set utf8 collate utf8_general_ci;
Grant all privileges on phabricator_phortune.* to 'keesh'@'%';
FLUSH PRIVILEGES;


### phabricator_phortune (mysql8.0)
CREATE DATABASE phabricator_nuance default character set utf8 collate utf8_general_ci;
Grant all privileges on phabricator_nuance.* to 'keesh'@'%';
FLUSH PRIVILEGES;




