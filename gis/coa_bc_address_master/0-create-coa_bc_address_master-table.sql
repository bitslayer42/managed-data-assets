SET search_path TO amd, public, topology, sde;

DROP TABLE IF EXISTS coa_bc_address_master;

CREATE TABLE coa_bc_address_master
(
    objectid integer NOT NULL,
    civicaddress_id integer,
    address_x numeric(38, 8),
    address_y numeric(38, 8),
    address_full character varying(40) COLLATE pg_catalog."default",
    address_number integer,
    address_unit character varying(4) COLLATE pg_catalog."default",
    address_street_prefix character varying(2) COLLATE pg_catalog."default",
    address_street_name character varying(30) COLLATE pg_catalog."default",
    address_street_type character varying(4) COLLATE pg_catalog."default",
    address_street_postdirection character varying(2) COLLATE pg_catalog."default",
    address_city character varying(28) COLLATE pg_catalog."default",
    address_commcode character varying(4) COLLATE pg_catalog."default",
    address_zipcode integer,
    location_type integer,
    address_change_date timestamp without time zone,
    maximo_type character varying(30) COLLATE pg_catalog."default",
    maximo_seq_num integer,
    asset_code character varying(50) COLLATE pg_catalog."default",
    mrc character varying(8) COLLATE pg_catalog."default",
    water_district character varying(8) COLLATE pg_catalog."default",
    trash_pickup_day character varying(10) COLLATE pg_catalog."default",
    recycling_pickup_district character varying(2) COLLATE pg_catalog."default",
    recycling_pickup_day character varying(10) COLLATE pg_catalog."default",
    jurisdiction_type character varying(150) COLLATE pg_catalog."default",
-- Added overlays
    zoning character varying(200),
    river_district character varying(200),
-- End added overlays
    centerline_id bigint,
    location_id bigint,
    parent_location_id bigint,
    property_pinnum character varying(15) COLLATE pg_catalog."default",
    property_pin character varying(15) COLLATE pg_catalog."default",
    property_pinext character varying(50) COLLATE pg_catalog."default",
    property_nmptype character varying(150) COLLATE pg_catalog."default",
    property_oldpinnum character varying(50) COLLATE pg_catalog."default",
    property_update_date character varying(50) COLLATE pg_catalog."default",
    property_update_reason character varying(50) COLLATE pg_catalog."default",
    property_deeddate character varying(50) COLLATE pg_catalog."default",
    property_taxyear character varying(50) COLLATE pg_catalog."default",
    property_deedurl character varying(254) COLLATE pg_catalog."default",
    property_platurl character varying(254) COLLATE pg_catalog."default",
    property_propcardurl character varying(150) COLLATE pg_catalog."default",
    property_acreage numeric(38, 8),
    property_class character varying(50) COLLATE pg_catalog."default",
    property_improved character varying(50) COLLATE pg_catalog."default",
    property_exempt character varying(50) COLLATE pg_catalog."default",
    property_priced character varying(50) COLLATE pg_catalog."default",
    property_totalmarketvalue numeric(38, 2),
    property_appraisedvalue numeric(38, 2),
    property_taxvalue numeric(38, 2),
    property_landuse character varying(50) COLLATE pg_catalog."default",
    property_neighborhoodcode character varying(50) COLLATE pg_catalog."default",
    property_landvalue numeric(38, 2),
    property_buildingvalue numeric(38, 2),
    property_improvementvalue numeric(38, 2),
    property_appraisalarea character varying(50) COLLATE pg_catalog."default",
    property_condounit character varying(50) COLLATE pg_catalog."default",
    property_condobuilding character varying(50) COLLATE pg_catalog."default",
    property_subname character varying(50) COLLATE pg_catalog."default",
    property_sublot character varying(50) COLLATE pg_catalog."default",
    property_subblock character varying(50) COLLATE pg_catalog."default",
    property_subsect character varying(50) COLLATE pg_catalog."default",
    property_township character varying(50) COLLATE pg_catalog."default",
    property_stamps numeric(38, 8),
    property_instrument character varying(50) COLLATE pg_catalog."default",
    property_firedistrict character varying(50) COLLATE pg_catalog."default",
    property_schooldistrict character varying(50) COLLATE pg_catalog."default",
    owner_name text COLLATE pg_catalog."default",
    owner_house_number character varying(50) COLLATE pg_catalog."default",
    owner_number_suffix character varying(50) COLLATE pg_catalog."default",
    owner_direction character varying(50) COLLATE pg_catalog."default",
    owner_street_name character varying(50) COLLATE pg_catalog."default",
    owner_street_type character varying(50) COLLATE pg_catalog."default",
    owner_careof character varying(50) COLLATE pg_catalog."default",
    owner_address character varying(50) COLLATE pg_catalog."default",
    owner_cityname character varying(50) COLLATE pg_catalog."default",
    owner_state character varying(50) COLLATE pg_catalog."default",
    owner_zipcode character varying(50) COLLATE pg_catalog."default",
    owner_account_number character varying(50) COLLATE pg_catalog."default",
    shape geometry,
    longitude double precision,
    lattitude double precision,
    CONSTRAINT enforce_geotype_shape CHECK (geometrytype(shape) = 'POINT'::text OR shape IS NULL)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

CREATE INDEX search
    ON amd.coa_bc_address_master USING btree
    (address_number ASC NULLS LAST, address_street_name ASC NULLS LAST, address_street_type ASC NULLS LAST, address_street_prefix ASC NULLS LAST, address_zipcode ASC NULLS LAST, address_commcode ASC NULLS LAST, address_unit ASC NULLS LAST)
    TABLESPACE pg_default;
    
GRANT SELECT ON TABLE coa_bc_address_master TO sde;

GRANT INSERT, SELECT, UPDATE, DELETE, TRUNCATE ON TABLE coa_bc_address_master TO ericjackson;
