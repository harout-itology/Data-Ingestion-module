/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `youtube_analytics_compressed`
--

create table amazon_analytics_data
(
    id                   bigint auto_increment
        primary key,
    country              varchar(10)                         not null,
    date                 date                                not null,
    isrc                 varchar(255)                        not null,
    upc                  varchar(255)                        not null,
    total_sales_quantity int                                 not null,
    total_sales_net      decimal(15, 4)                      not null,
    last_updated         timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP
);

create index date
    on amazon_analytics_data (date);

create index date_isrc
    on amazon_analytics_data (date, isrc);

create index date_upc
    on amazon_analytics_data (date, upc);

create index date_upc_isrc
    on amazon_analytics_data (date, upc, isrc);

create table amazon_analytics_import_history
(
    id           int auto_increment
        primary key,
    date         date                                not null,
    type         varchar(255)                        not null,
    country      varchar(255)                        not null,
    status       tinyint(1)                          not null,
    last_updated timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP
);

create index date_type
    on amazon_analytics_import_history (date, type);

create table amazon_prime_analytics_compressed
(
    id           int auto_increment
        primary key,
    country      varchar(255)                        not null,
    date         date                                not null,
    upc          varchar(255)                        not null,
    isrc         varchar(255)                        not null,
    total        int                                 not null,
    last_updated timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP
);

create index date
    on amazon_prime_analytics_compressed (date);

create index isrc_date
    on amazon_prime_analytics_compressed (isrc, date);

create table amazon_prime_analytics_data
(
    id                      bigint auto_increment
        primary key,
    country                 varchar(10)                         not null,
    date                    date                                not null,
    upc                     varchar(255)                        not null,
    isrc                    varchar(255)                        not null,
    total_streams           int                                 not null,
    last_updated            timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP,
    listening_length_data   text                                null,
    subscription_plan_data  text                                null,
    device_type_data        text                                null,
    postal_code_data        text                                null,
    stream_source_data      text                                null,
    stream_source_name_data text                                null,
    offline_plays           int                                 not null
);

create index date
    on amazon_prime_analytics_data (date);

create index isrc_date
    on amazon_prime_analytics_data (isrc, date);

create table amazon_streaming_analytics_import_history
(
    id           int auto_increment
        primary key,
    date         date                                not null,
    type         varchar(255)                        not null,
    country      varchar(255)                        not null,
    status       tinyint(1)                          not null,
    last_updated timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP
);

create index date_type
    on amazon_streaming_analytics_import_history (date, type);

create table amazon_unlimited_analytics_compressed
(
    id           int auto_increment
        primary key,
    country      varchar(255)                        not null,
    date         date                                not null,
    upc          varchar(255)                        not null,
    isrc         varchar(255)                        not null,
    total        int                                 not null,
    last_updated timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP
);

create index date
    on amazon_unlimited_analytics_compressed (date);

create index isrc_date
    on amazon_unlimited_analytics_compressed (isrc, date);

create table amazon_unlimited_analytics_data
(
    id                      bigint auto_increment
        primary key,
    country                 varchar(10)                         not null,
    date                    date                                not null,
    upc                     varchar(255)                        not null,
    isrc                    varchar(255)                        not null,
    total_streams           int                                 not null,
    last_updated            timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP,
    listening_length_data   text                                null,
    subscription_plan_data  text                                null,
    device_type_data        text                                null,
    postal_code_data        text                                null,
    stream_source_data      text                                null,
    stream_source_name_data text                                null,
    offline_plays           int                                 not null
);

create index date
    on amazon_unlimited_analytics_data (date);

create index isrc_country
    on amazon_unlimited_analytics_data (isrc, country);

create index isrc_date
    on amazon_unlimited_analytics_data (isrc, date);

create table analytics_countries
(
    country_id       int auto_increment
        primary key,
    country_name     varchar(250) not null,
    country_code     varchar(10)  not null,
    amazon           int          not null,
    google           int          not null,
    itunes           int          not null,
    spotify          int          not null,
    amazon_prime     tinyint(1)   not null,
    amazon_unlimited tinyint(1)   not null
);

create index country_code
    on analytics_countries (country_code);

create index country_name
    on analytics_countries (country_name);

create table analytics_slopes
(
    id                           int auto_increment,
    isrc                         varchar(20)                         not null,
    upc                          varchar(20)                         not null,
    start_date                   date                                not null,
    end_date                     date                                not null,
    start_date_end_date_combined varchar(16)                         not null,
    spotify_percent_change       decimal(32, 15)                     null,
    spotify_slope                decimal(32, 15)                     null,
    spotify_average_slope        decimal(32, 15)                     null,
    spotify_track_total_sum      int                                 null,
    spotify_first_day_sum        int                                 null,
    spotify_last_day_sum         int                                 null,
    spotify_streams_by_day       longtext                            null,
    apple_music_percent_change   decimal(32, 15)                     null,
    apple_music_slope            decimal(32, 15)                     null,
    apple_music_average_slope    decimal(32, 15)                     null,
    apple_music_track_total_sum  int                                 null,
    apple_music_first_day_sum    int                                 null,
    apple_music_last_day_sum     int                                 null,
    apple_music_streams_by_day   longtext                            null,
    pandora_percent_change       decimal(32, 15)                     null,
    pandora_slope                decimal(32, 15)                     null,
    pandora_average_slope        decimal(32, 15)                     null,
    pandora_track_total_sum      int                                 null,
    pandora_first_day_sum        int                                 null,
    pandora_last_day_sum         int                                 null,
    pandora_streams_by_day       longtext                            null,
    google_music_percent_change  decimal(32, 15)                     null,
    google_music_slope           decimal(32, 15)                     null,
    google_music_average_slope   decimal(32, 15)                     null,
    google_music_track_total_sum int                                 null,
    google_music_first_day_sum   int                                 null,
    google_music_last_day_sum    int                                 null,
    google_music_streams_by_day  longtext                            null,
    deezer_percent_change        decimal(32, 15)                     null,
    deezer_slope                 decimal(32, 15)                     null,
    deezer_average_slope         decimal(32, 15)                     null,
    deezer_track_total_sum       int                                 null,
    deezer_first_day_sum         int                                 null,
    deezer_last_day_sum          int                                 null,
    deezer_streams_by_day        longtext                            null,
    total_percent_change         decimal(32, 15)                     null,
    total_slope                  decimal(32, 15)                     null,
    total_average_slope          decimal(32, 15)                     null,
    total_track_total_sum        int                                 null,
    total_first_day_sum          int                                 null,
    total_last_day_sum           int                                 null,
    total_streams_by_day         longtext                            null,
    last_updated                 timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP,
    primary key (id, isrc, upc, start_date, end_date, start_date_end_date_combined)
);

create index start_date_end_date_combined
    on analytics_slopes (start_date_end_date_combined);

create table analytics_slopes_current_dates
(
    id                           int auto_increment
        primary key,
    start_date                   varchar(255)                        null,
    end_date                     varchar(255)                        null,
    start_date_end_date_combined varchar(255)                        null,
    date_range_text              varchar(255)                        null,
    last_updated                 timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP
);

create table apple_analytics_compressed
(
    id           int auto_increment
        primary key,
    country      varchar(255)                        not null,
    date         date                                not null,
    upc          varchar(255)                        not null,
    isrc         varchar(255)                        not null,
    total        int                                 not null,
    last_updated timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP
);

create index date
    on apple_analytics_compressed (date);

create index date_isrc
    on apple_analytics_compressed (date, isrc);

create index isrc_date
    on apple_analytics_compressed (isrc, date);

create table apple_analytics_compressed_90days
(
    id           int auto_increment
        primary key,
    country      varchar(255)                        not null,
    date         date                                not null,
    upc          varchar(255)                        not null,
    isrc         varchar(255)                        not null,
    total        int                                 not null,
    last_updated timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP
);

create index date
    on apple_analytics_compressed_90days (date);

create index isrc_date
    on apple_analytics_compressed_90days (isrc, date);

create index upc_isrc_date
    on apple_analytics_compressed_90days (upc, isrc, date);

create table apple_analytics_data
(
    id                   bigint auto_increment
        primary key,
    country              varchar(10)                         not null,
    date                 date                                not null,
    apple_identifier     varchar(255)                        not null,
    total_streams        int                                 not null,
    end_reason_type_data text                                not null,
    time_bucket_data     text                                not null,
    utc_offset_data      text                                not null,
    membership_type_data text                                not null,
    membership_mode_data text                                not null,
    offline_data         text                                not null,
    device_type_data     text                                not null,
    os_data              text                                not null,
    stream_source_data   text                                not null,
    container_type_data  text                                not null,
    playlist_type_data   text                                not null,
    playlist_id_data     text                                not null,
    playlist_name_data   text                                not null,
    audio_format_data    text                                null,
    last_updated         timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP
);

create index apple_id_date
    on apple_analytics_data (apple_identifier, date);

create index country_apple_identifier
    on apple_analytics_data (country, apple_identifier);

create index country_date
    on apple_analytics_data (country, date);

create index date
    on apple_analytics_data (date);

create table apple_analytics_demographics_data
(
    id               bigint auto_increment
        primary key,
    country          varchar(10)                         not null,
    date             date                                not null,
    apple_identifier varchar(255)                        not null,
    total_streams    int                                 not null,
    gender_data      text                                not null,
    age_data         text                                not null,
    last_updated     timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP
);

create index apple_id_date
    on apple_analytics_demographics_data (apple_identifier, date);

create index country_date
    on apple_analytics_demographics_data (country, date);

create index date
    on apple_analytics_demographics_data (date);

create table apple_analytics_import_history
(
    id           int auto_increment
        primary key,
    date         date                                not null,
    type         varchar(255)                        not null,
    country      varchar(255)                        not null,
    status       tinyint(1)                          not null,
    last_updated timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP
);

create index date_type
    on apple_analytics_import_history (date, type);

create table apple_music_playlist_plays
(
    id               int auto_increment
        primary key,
    playlist_id      varchar(255)                        not null,
    apple_identifier varchar(255)                        not null,
    date             date                                not null,
    plays            int                                 not null,
    last_updated     timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP
);

create index date
    on apple_music_playlist_plays (date);

create index playlist_id
    on apple_music_playlist_plays (playlist_id);

create index track_id
    on apple_music_playlist_plays (apple_identifier);

create table apple_music_playlists
(
    id          int auto_increment
        primary key,
    playlist_id varchar(255) not null,
    name        varchar(255) not null
);

create index playlist_id
    on apple_music_playlists (playlist_id);

create table apple_shazam_data
(
    id               int auto_increment
        primary key,
    isrc             varchar(255) not null,
    ingest_datestamp date         not null,
    ingest_hour      int(3)       not null,
    country          varchar(255) not null,
    state_province   varchar(255) not null,
    city             varchar(255) not null,
    shazams          int          not null
)
    charset = utf8;

create index isrc
    on apple_shazam_data (isrc);

create table apple_track_mappings
(
    id               int auto_increment
        primary key,
    track_id         int          not null,
    album_id         int          not null,
    apple_identifier varchar(255) not null,
    product_type     int          not null
);

create index album_id
    on apple_track_mappings (album_id);

create index apple_identifier
    on apple_track_mappings (apple_identifier);

create index product_type
    on apple_track_mappings (product_type);

create table cooltrax_playlist
(
    cooltrax_id int auto_increment
        primary key,
    artist_name varchar(255) not null,
    track_title varchar(255) not null,
    track_file  varchar(255) not null,
    sort_id     int          not null
);

create table deezer_analytics_compressed
(
    id           int auto_increment
        primary key,
    country      varchar(255)                        not null,
    date         date                                not null,
    upc          varchar(255)                        not null,
    isrc         varchar(255)                        not null,
    total        int                                 not null,
    last_updated timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP
);

create index date
    on deezer_analytics_compressed (date);

create index isrc_date
    on deezer_analytics_compressed (isrc, date);

create table deezer_analytics_compressed_90days
(
    id           int auto_increment
        primary key,
    country      varchar(255)                        not null,
    date         date                                not null,
    upc          varchar(255)                        not null,
    isrc         varchar(255)                        not null,
    total        int                                 not null,
    last_updated timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP
);

create index date
    on deezer_analytics_compressed_90days (date);

create index isrc_date
    on deezer_analytics_compressed_90days (isrc, date);

create index upc_isrc_date
    on deezer_analytics_compressed_90days (upc, isrc, date);

create table deezer_analytics_data
(
    id                 bigint auto_increment
        primary key,
    country            varchar(10)                         not null,
    date               date                                not null,
    upc                varchar(255)                        not null,
    isrc               varchar(255)                        not null,
    total_streams      int                                 not null,
    last_updated       timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP,
    service_data       text                                null,
    context_type_data  text                                null,
    playlist_name_data text                                null,
    gender_data        text                                null,
    age_data           text                                null,
    device_type_data   text                                null,
    os_data            text                                null
);

create index date
    on deezer_analytics_data (date);

create index isrc_date
    on deezer_analytics_data (isrc, date);

create table deezer_analytics_import_history
(
    id           int auto_increment
        primary key,
    date         date                                not null,
    type         varchar(255)                        not null,
    country      varchar(255)                        not null,
    status       tinyint(1)                          not null,
    last_updated timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP
);

create index date_type
    on deezer_analytics_import_history (date, type);

create table google_analytics_compressed
(
    id           int auto_increment
        primary key,
    country      varchar(255)                        not null,
    date         date                                not null,
    upc          varchar(255)                        not null,
    isrc         varchar(255)                        not null,
    total        int                                 not null,
    last_updated timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP
);

create index date
    on google_analytics_compressed (date);

create index isrc_date
    on google_analytics_compressed (isrc, date);

create table google_analytics_compressed_90days
(
    id           int auto_increment
        primary key,
    country      varchar(255)                        not null,
    date         date                                not null,
    upc          varchar(255)                        not null,
    isrc         varchar(255)                        not null,
    total        int                                 not null,
    last_updated timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP
);

create index date
    on google_analytics_compressed_90days (date);

create index isrc_date
    on google_analytics_compressed_90days (isrc, date);

create index upc_isrc_date
    on google_analytics_compressed_90days (upc, isrc, date);

create table google_analytics_data
(
    id            bigint auto_increment
        primary key,
    country       varchar(10)                         not null,
    date          date                                not null,
    upc           varchar(255)                        not null,
    isrc          varchar(255)                        not null,
    total_streams int                                 not null,
    last_updated  timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP
);

create index date
    on google_analytics_data (date);

create index isrc_date
    on google_analytics_data (isrc, date);

create table google_analytics_import_history
(
    id           int auto_increment
        primary key,
    date         date                                not null,
    type         varchar(255)                        not null,
    country      varchar(255)                        not null,
    status       tinyint(1)                          not null,
    last_updated timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP
);

create index country_date_type
    on google_analytics_import_history (country, date, type);

create index date_type
    on google_analytics_import_history (date, type);

create table google_preorder_analytics_data
(
    id                      bigint auto_increment
        primary key,
    country                 varchar(10)                         not null,
    date                    date                                not null,
    upc                     varchar(255)                        not null,
    isrc                    varchar(255)                        not null,
    total_preorder_quantity int                                 not null,
    total_preorder_gross    decimal(15, 4)                      not null,
    total_preorder_net      decimal(15, 4)                      not null,
    zipcode_data            text                                not null,
    last_updated            timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP
);

create index date
    on google_preorder_analytics_data (date);

create index date_isrc
    on google_preorder_analytics_data (date, isrc);

create index date_upc
    on google_preorder_analytics_data (date, upc);

create index date_upc_isrc
    on google_preorder_analytics_data (date, upc, isrc);

create table google_sales_analytics_data
(
    id                   bigint auto_increment
        primary key,
    country              varchar(10)                         not null,
    date                 date                                not null,
    upc                  varchar(255)                        not null,
    isrc                 varchar(255)                        not null,
    total_sales_quantity int                                 not null,
    total_sales_gross    decimal(15, 4)                      not null,
    total_sales_net      decimal(15, 4)                      not null,
    zipcode_data         text                                not null,
    last_updated         timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP
);

create index date
    on google_sales_analytics_data (date);

create index date_isrc
    on google_sales_analytics_data (date, isrc);

create index date_upc
    on google_sales_analytics_data (date, upc);

create index date_upc_isrc
    on google_sales_analytics_data (date, upc, isrc);

create table itunes_analytics_data
(
    id                   bigint auto_increment
        primary key,
    country              varchar(10)                         not null,
    date                 date                                not null,
    apple_identifier     int                                 not null,
    album_id             int                                 not null,
    track_id             int                                 not null,
    total_sales_quantity int                                 not null,
    total_sales_gross    decimal(15, 4)                      not null,
    total_sales_net      decimal(15, 4)                      not null,
    last_updated         timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP
);

create index apple_id_date
    on itunes_analytics_data (apple_identifier, date);

create index apple_identifier
    on itunes_analytics_data (apple_identifier);

create index date
    on itunes_analytics_data (date);

create table itunes_analytics_import_history
(
    id           int auto_increment
        primary key,
    date         date                                not null,
    type         varchar(255)                        not null,
    country      varchar(255)                        not null,
    status       tinyint(1)                          not null,
    last_updated timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP
);

create index date_type
    on itunes_analytics_import_history (date, type);

create table neurotic_analytics_data
(
    id                   bigint auto_increment
        primary key,
    country              varchar(10)                         not null,
    date                 date                                not null,
    report_date          date                                not null,
    upc                  varchar(255)                        not null,
    isrc                 varchar(255)                        not null,
    total_sales_quantity int                                 not null,
    total_sales_gross    decimal(15, 4)                      not null,
    total_sales_net      decimal(15, 4)                      not null,
    store_data           text                                not null,
    last_updated         timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP
);

create index date
    on neurotic_analytics_data (date);

create index date_isrc
    on neurotic_analytics_data (date, isrc);

create index date_upc
    on neurotic_analytics_data (date, upc);

create index date_upc_isrc
    on neurotic_analytics_data (date, upc, isrc);

create table neurotic_analytics_import_history
(
    id           int auto_increment
        primary key,
    date         date                                not null,
    type         varchar(255)                        not null,
    country      varchar(255)                        not null,
    status       tinyint(1)                          not null,
    last_updated timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP
);

create table pandora_analytics_compressed
(
    id           int auto_increment
        primary key,
    country      varchar(255)                        not null,
    date         date                                not null,
    upc          varchar(255)                        not null,
    isrc         varchar(255)                        not null,
    total        int                                 not null,
    last_updated timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP
);

create index date
    on pandora_analytics_compressed (date);

create index isrc_date
    on pandora_analytics_compressed (isrc, date);

create table pandora_analytics_compressed_90days
(
    id           int auto_increment
        primary key,
    country      varchar(255)                        not null,
    date         date                                not null,
    upc          varchar(255)                        not null,
    isrc         varchar(255)                        not null,
    total        int                                 not null,
    last_updated timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP
);

create index date
    on pandora_analytics_compressed_90days (date);

create index isrc_date
    on pandora_analytics_compressed_90days (isrc, date);

create index upc_isrc_date
    on pandora_analytics_compressed_90days (upc, isrc, date);

create table pandora_analytics_data
(
    id                    int auto_increment
        primary key,
    country               varchar(10)                         not null,
    date                  date                                not null,
    pandora_track_id      varchar(255)                        not null,
    total_streams         int                                 not null,
    play_type_data        text                                not null,
    gender_data           text                                not null,
    age_data              text                                not null,
    listening_length_data text                                not null,
    device_category_data  text                                not null,
    device_type_data      text                                not null,
    listener_state_data   text                                not null,
    source_type_data      text                                not null,
    source_name_data      longtext                            not null,
    last_updated          timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP
);

create index country_date
    on pandora_analytics_data (country, date);

create index date
    on pandora_analytics_data (date);

create index pandora_track_id_date
    on pandora_analytics_data (pandora_track_id, date);

create table pandora_analytics_import_history
(
    id           int auto_increment
        primary key,
    date         date                                not null,
    type         varchar(255)                        not null,
    country      varchar(255)                        not null,
    status       tinyint(1)                          not null,
    last_updated timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP
);

create index date_type
    on pandora_analytics_import_history (date, type);

create table pandora_analytics_riaa
(
    id               bigint auto_increment
        primary key,
    pandora_track_id bigint                              null,
    date             date                                null,
    total_streams    int                                 null,
    last_updated     timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP
);

create index date
    on pandora_analytics_riaa (date);

create index pandora_track_id
    on pandora_analytics_riaa (pandora_track_id);

create table pandora_track_mappings
(
    id               int auto_increment
        primary key,
    track_id         int          not null,
    album_id         int          not null,
    pandora_track_id varchar(255) not null
);

create index album_id
    on pandora_track_mappings (album_id);

create index pandora_track_id
    on pandora_track_mappings (pandora_track_id);

create index track_id
    on pandora_track_mappings (track_id);

create table soundcloud_analytics_import_history
(
    id           int auto_increment
        primary key,
    date         date                                not null,
    type         varchar(255)                        not null,
    country      varchar(255)                        not null,
    status       tinyint(1)                          not null,
    last_updated timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP
);

create index country_date_type
    on soundcloud_analytics_import_history (country, date, type);

create index date_type
    on soundcloud_analytics_import_history (date, type);

create table soundcloud_playlists_analytics_data_raw
(
    id                               int(11) unsigned auto_increment
        primary key,
    reporting_start_date             date         null,
    reporting_end_date               date         null,
    country                          varchar(4)   null,
    playlist_type                    varchar(255) null,
    playlist_id                      varchar(255) null,
    account_id                       varchar(255) null,
    playlist_permalink               varchar(255) null,
    playlist_name                    varchar(255) null,
    avg_streams_per_track            int(20)      null,
    avg_play_time_per_track_mins     varchar(20)  null,
    nb_rightsholder_streams          int          null,
    nb_streams                       int          null,
    nb_users_streaming_from_playlist int          null,
    nb_favorites                     int          null,
    nb_reposts_shares                int          null
);

create table soundcloud_stream_level_analytics_compressed
(
    id           int auto_increment
        primary key,
    country      varchar(255)                        not null,
    date         date                                not null,
    upc          varchar(255)                        not null,
    isrc         varchar(255)                        not null,
    total        int                                 not null,
    last_updated timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP
)
    collate = utf8_unicode_ci;

create index date
    on soundcloud_stream_level_analytics_compressed (date);

create index isrc_date
    on soundcloud_stream_level_analytics_compressed (isrc, date);

create table soundcloud_stream_level_analytics_data_raw
(
    id                      int(11) unsigned auto_increment
        primary key,
    reporting_start_date    date         null,
    reporting_end_date      date         null,
    country                 varchar(4)   null,
    customer_id             varchar(255) null,
    track_id                varchar(255) null,
    isrc                    varchar(255) null,
    timestamp               date         null,
    operating_system        varchar(255) null,
    client_application      varchar(255) null,
    playlist_type           varchar(255) null,
    playlist_id             varchar(255) null,
    position_in_playlist    int          null,
    track_to_playlist       int          null,
    play_length             varchar(10)  null,
    track_favorited         tinyint(1)   null,
    track_reposted_shared   tinyint(1)   null,
    track_message_posted    tinyint(1)   null,
    track_to_playlist_added tinyint(1)   null
);

create index country
    on soundcloud_stream_level_analytics_data_raw (country);

create index isrc
    on soundcloud_stream_level_analytics_data_raw (isrc);

create index reporting_start_date
    on soundcloud_stream_level_analytics_data_raw (reporting_start_date);

create index track_id
    on soundcloud_stream_level_analytics_data_raw (track_id);

create table soundcloud_track_information_analytics_data_raw
(
    id                        int(11) unsigned auto_increment
        primary key,
    reporting_start_date      date         null,
    reporting_end_date        date         null,
    track_id                  varchar(255) null,
    isrc                      varchar(255) null,
    album_code                varchar(255) null,
    album_artist              varchar(255) null,
    track_artist              varchar(255) null,
    track_title               varchar(255) null,
    album_name                varchar(255) null,
    track_permalink           varchar(255) null,
    album_permalink           varchar(255) null,
    track_supply_chain_status varchar(255) null,
    track_length              varchar(25)  null
);

create table spotify_analytics_compressed
(
    id           int auto_increment
        primary key,
    country      varchar(255)                        not null,
    date         date                                not null,
    upc          varchar(255)                        not null,
    isrc         varchar(255)                        not null,
    total        int                                 not null,
    last_updated timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP
);

create index date
    on spotify_analytics_compressed (date);

create index isrc_date
    on spotify_analytics_compressed (isrc, date);

create index isrc_upc_date
    on spotify_analytics_compressed (isrc, upc, date);

create table spotify_analytics_compressed_90days
(
    id           int auto_increment
        primary key,
    country      varchar(255)                        not null,
    date         date                                not null,
    upc          varchar(255)                        not null,
    isrc         varchar(255)                        not null,
    total        int                                 not null,
    last_updated timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP
);

create index date
    on spotify_analytics_compressed_90days (date);

create index isrc_date
    on spotify_analytics_compressed_90days (isrc, date);

create index upc_isrc_date
    on spotify_analytics_compressed_90days (upc, isrc, date);

create table spotify_analytics_compressed_slopes
(
    id           int auto_increment
        primary key,
    date         date         not null,
    upc          varchar(255) not null,
    isrc         varchar(255) not null,
    total        int          not null,
    date_range_0 tinyint(1)   not null,
    date_range_1 tinyint(1)   not null,
    date_range_2 tinyint(1)   not null
);

create index date
    on spotify_analytics_compressed_slopes (date);

create index date_range_0
    on spotify_analytics_compressed_slopes (date_range_0);

create index date_range_1
    on spotify_analytics_compressed_slopes (date_range_1);

create index date_range_2
    on spotify_analytics_compressed_slopes (date_range_2);

create index isrc_date
    on spotify_analytics_compressed_slopes (isrc, date);

create index isrc_upc_date
    on spotify_analytics_compressed_slopes (isrc, upc, date);

create table spotify_analytics_data
(
    id               int auto_increment
        primary key,
    country          varchar(10)                         not null,
    date             date                                not null,
    spotify_track_id varchar(255)                        not null,
    total_streams    int                                 not null,
    source_data      text                                not null,
    source_uri_data  text                                not null,
    device_data      text                                not null,
    os_data          text                                not null,
    length_data      text                                not null,
    region_data      text                                not null,
    zipcode_data     text                                not null,
    access_data      text                                not null,
    gender_data      text                                not null,
    type_data        text                                not null,
    age_data         text                                not null,
    last_updated     timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP
);

create index country_date
    on spotify_analytics_data (country, date);

create index country_track_id
    on spotify_analytics_data (country, spotify_track_id);

create index date
    on spotify_analytics_data (date);

create index track_id_date
    on spotify_analytics_data (spotify_track_id, date);

create table spotify_analytics_import_history
(
    id           int auto_increment
        primary key,
    date         date                                not null,
    type         varchar(255)                        not null,
    country      varchar(255)                        not null,
    status       tinyint(1)                          not null,
    last_updated timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP
);

create index date_type
    on spotify_analytics_import_history (date, type);

create table spotify_playlist_track_history
(
    id                        int auto_increment
        primary key,
    spotify_playlist_track_id int                                 not null,
    info                      varchar(255)                        not null,
    timestamp                 timestamp default CURRENT_TIMESTAMP not null
);

create table spotify_playlist_tracks
(
    id                int auto_increment
        primary key,
    playlist_id       varchar(255) not null,
    track_id          int          not null,
    date_added        datetime     null,
    date_removed      datetime     null,
    popularity        int          not null,
    highest_position  int          not null,
    current_position  int          not null,
    previous_position int          not null
);

create index playlist_id
    on spotify_playlist_tracks (playlist_id, track_id);

create index playlist_id_2
    on spotify_playlist_tracks (playlist_id);

create index track_id
    on spotify_playlist_tracks (track_id);

create table spotify_playlists
(
    id              int auto_increment
        primary key,
    playlist_id     varchar(255) not null,
    user_id         varchar(255) not null,
    name            varchar(255) not null,
    description     varchar(255) not null,
    open_url        varchar(255) not null,
    image_url       varchar(255) not null,
    followers       int          not null,
    uri             varchar(255) not null,
    last_added_date datetime     null
);

create index playlist_id
    on spotify_playlists (playlist_id);

create index uri
    on spotify_playlists (uri(100));

create index user_id
    on spotify_playlists (user_id);

create table spotify_track_mappings
(
    id               int auto_increment
        primary key,
    track_id         int          not null,
    album_id         int          not null,
    spotify_track_id varchar(255) not null,
    uri              varchar(255) not null
);

create index album_id
    on spotify_track_mappings (album_id);

create index spotify_track_id
    on spotify_track_mappings (spotify_track_id);

create index track_id
    on spotify_track_mappings (track_id);

create index uri
    on spotify_track_mappings (uri);

create table spotify_users
(
    user_id    varchar(255)            null,
    type       varchar(45)             null,
    product    varchar(255) default '' not null,
    partner    varchar(255) default '' not null,
    age_group  varchar(255) default '' not null,
    country    varchar(45)             null,
    birth_year varchar(45)             null,
    gender     varchar(45)             null,
    region     varchar(45)             null,
    zipcode    varchar(45)             null,
    access     varchar(45)             null
);

create table streaming_app_playlist_tracks
(
    id          int auto_increment
        primary key,
    playlist_id int                                 not null,
    product_id  int                                 not null,
    track_id    int                                 not null,
    sort_order  int                                 not null,
    created     timestamp default CURRENT_TIMESTAMP null
);

create table streaming_app_playlists
(
    id          int auto_increment
        primary key,
    name        varchar(255)                        not null,
    description varchar(255)                        not null,
    active      tinyint(1)                          not null,
    image       varchar(255)                        not null,
    sort_order  int                                 not null,
    created     timestamp default CURRENT_TIMESTAMP null
);

create table tidal_analytics_data
(
    id            bigint auto_increment
        primary key,
    country       varchar(10)                         not null,
    date          date                                not null,
    upc           varchar(255)                        not null,
    isrc          varchar(255)                        not null,
    total_streams int                                 not null,
    last_updated  timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP
);

create index date
    on tidal_analytics_data (date);

create index isrc_date
    on tidal_analytics_data (isrc, date);

create table tidal_analytics_import_history
(
    id           int auto_increment
        primary key,
    date         date                                not null,
    type         varchar(255)                        not null,
    country      varchar(255)                        not null,
    status       tinyint(1)                          not null,
    last_updated timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP
);

create table top_tracks_by_region_spotify
(
    date             date                                not null,
    spotify_track_id varchar(255)                        not null,
    user_country     varchar(3)                          not null,
    play_country     varchar(3)                          not null,
    region           varchar(255)                        not null,
    total_streams    int                                 not null,
    last_updated     timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP
);

create index date
    on top_tracks_by_region_spotify (date);

create index date_spotify_track_id
    on top_tracks_by_region_spotify (date, spotify_track_id);

create index play_country
    on top_tracks_by_region_spotify (play_country);

create index play_country_region
    on top_tracks_by_region_spotify (play_country, region);

create index region
    on top_tracks_by_region_spotify (region);

create index spotify_track_id
    on top_tracks_by_region_spotify (spotify_track_id);

create index user_country
    on top_tracks_by_region_spotify (user_country);

create table umg_analytics_file_uploads
(
    id           int auto_increment
        primary key,
    filename     varchar(255)                        null,
    last_updated timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP
);

create index filename
    on umg_analytics_file_uploads (filename);

create table vevo_analytics_data
(
    id           bigint auto_increment
        primary key,
    country      varchar(10)                         not null,
    date         date                                not null,
    isrc         varchar(255)                        not null,
    total_views  int                                 not null,
    last_updated timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP
);

create index country
    on vevo_analytics_data (country);

create index date
    on vevo_analytics_data (date);

create index date_isrc
    on vevo_analytics_data (date, isrc);

create index isrc
    on vevo_analytics_data (isrc);

create index isrc_date
    on vevo_analytics_data (isrc, date);

create table vevo_analytics_import_history
(
    id           int auto_increment
        primary key,
    date         date                                not null,
    type         varchar(255)                        not null,
    status       tinyint(1)                          not null,
    last_updated timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP
);

create index date_type
    on vevo_analytics_import_history (date, type);

create table youtube_analytics_compressed
(
    id           int auto_increment
        primary key,
    country      varchar(255)                        not null,
    date         date                                not null,
    upc          varchar(255)                        not null,
    isrc         varchar(255)                        not null,
    total        int                                 not null,
    last_updated timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP
);

create index date
    on youtube_analytics_compressed (date);

create index isrc_date
    on youtube_analytics_compressed (isrc, date);

create table youtube_analytics_data
(
    id                                 bigint auto_increment
        primary key,
    country                            varchar(10)                         not null,
    date                               date                                not null,
    youtube_asset_id                   varchar(255)                        not null,
    total_streams                      int                                 not null,
    channel_id_data                    text                                not null,
    video_id_data                      text                                not null,
    subscribed_status_data             text                                not null,
    playback_location_type_data        text                                not null,
    traffic_source_type_data           text                                not null,
    device_type_data                   text                                not null,
    os_data                            text                                not null,
    average_view_duration_seconds_data text                                not null,
    red_view_data                      text                                not null,
    uploader_type_data                 text                                null,
    last_updated                       timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP
);

create index asset_id_date
    on youtube_analytics_data (youtube_asset_id, date);

create index country_date
    on youtube_analytics_data (country, date);

create index date
    on youtube_analytics_data (date);

create table youtube_analytics_import_history
(
    id           int auto_increment
        primary key,
    date         date                                not null,
    type         varchar(255)                        not null,
    country      varchar(255)                        not null,
    job_id       varchar(255)                        not null,
    status       tinyint(1)                          not null,
    last_updated timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP
);

create index date_type
    on youtube_analytics_import_history (date, type);

create table youtube_asset_mappings
(
    id       int auto_increment
        primary key,
    track_id int          not null,
    album_id int          not null,
    asset_id varchar(255) not null
)
    collate = utf8_unicode_ci;

create index album_id
    on youtube_asset_mappings (album_id);

create index asset_id
    on youtube_asset_mappings (asset_id);

create index track_id
    on youtube_asset_mappings (track_id);

create table youtube_premium_analytics_data
(
    id                                 bigint auto_increment
        primary key,
    country                            varchar(10)                         not null,
    date                               date                                not null,
    youtube_asset_id                   varchar(255)                        not null,
    total_streams                      int                                 not null,
    channel_id_data                    text                                not null,
    video_id_data                      text                                not null,
    subscribed_status_data             text                                not null,
    playback_location_type_data        text                                not null,
    traffic_source_type_data           text                                not null,
    device_type_data                   text                                not null,
    os_data                            text                                not null,
    average_view_duration_seconds_data text                                not null,
    red_view_data                      text                                not null,
    uploader_type_data                 text                                null,
    last_updated                       timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP
)
    collate = utf8_unicode_ci;

create index asset_id_date
    on youtube_premium_analytics_data (youtube_asset_id, date);

create index country_date
    on youtube_premium_analytics_data (country, date);

create index date
    on youtube_premium_analytics_data (date);

create table youtube_ugc_analytics_data
(
    id                                 bigint auto_increment
        primary key,
    country                            varchar(10)                         not null,
    date                               date                                not null,
    youtube_asset_id                   varchar(255)                        not null,
    total_streams                      int                                 not null,
    channel_id_data                    text                                not null,
    video_id_data                      text                                not null,
    subscribed_status_data             text                                not null,
    playback_location_type_data        text                                not null,
    traffic_source_type_data           text                                not null,
    device_type_data                   text                                not null,
    os_data                            text                                not null,
    average_view_duration_seconds_data text                                not null,
    red_view_data                      text                                not null,
    uploader_type_data                 text                                null,
    last_updated                       timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP
)
    collate = utf8_unicode_ci;

create index asset_id_date
    on youtube_ugc_analytics_data (youtube_asset_id, date);

create index country_date
    on youtube_ugc_analytics_data (country, date);

create index date
    on youtube_ugc_analytics_data (date);

create table youtube_video_analytics_compressed
(
    id           int auto_increment
        primary key,
    country      varchar(255)                        not null,
    date         date                                not null,
    video_id     varchar(255)                        not null,
    upc          varchar(255)                        not null,
    isrc         varchar(255)                        not null,
    total        int                                 not null,
    last_updated timestamp default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP
)
    collate = utf8_unicode_ci;

create index country
    on youtube_video_analytics_compressed (country);

create index date
    on youtube_video_analytics_compressed (date);

create index isrc_date
    on youtube_video_analytics_compressed (isrc, date);

create index video_id
    on youtube_video_analytics_compressed (video_id);

create table youtube_video_analytics_data
(
    id                                 bigint auto_increment
        primary key,
    country                            varchar(10)                         not null,
    date                               date                                not null,
    youtube_video_id                   varchar(255)                        not null,
    total_streams                      int                                 not null,
    live_on_demand_data                text                                not null,
    channel_id_data                    text                                not null,
    subscribed_status_data             text                                not null,
    playback_location_type_data        text                                not null,
    traffic_source_type_data           text                                not null,
    device_type_data                   text                                not null,
    os_data                            text                                not null,
    average_view_duration_seconds_data text                                not null,
    red_view_data                      text                                not null,
    uploader_type_data                 text                                null,
    last_updated                       timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP
)
    collate = utf8_unicode_ci;

create index country_date
    on youtube_video_analytics_data (country, date);

create index date
    on youtube_video_analytics_data (date);

create index video_id_date
    on youtube_video_analytics_data (youtube_video_id, date);

create table youtube_video_mappings
(
    id            int auto_increment
        primary key,
    video_id      varchar(255) not null,
    video_title   varchar(255) not null,
    channel_id    varchar(255) not null,
    channel_title varchar(255) not null
);

create index channel_id
    on youtube_video_mappings (channel_id);

create index channel_title
    on youtube_video_mappings (channel_title);

create index video_id
    on youtube_video_mappings (video_id);

