--
-- Copyright (C) 2020 Oracle and/or its affiliates.
--
-- This program is free software; you can redistribute it and/or
-- modify it under the terms of the GNU General Public License
-- as published by the Free Software Foundation, version 2
--
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
-- 02110-1301, USA.
--

CREATE OR REPLACE VIEW
rhnServerOutdatedPackages
(
    server_id,
    package_name_id,
    package_evr_id,
    package_arch_id,
    package_nvre,
    errata_id,
    errata_advisory
)
AS
SELECT DISTINCT SNC.server_id,
         P.name_id,
         P.evr_id,
         P.package_arch_id,
         PN.name || '-' || evr_t_as_vre_simple( PE.evr ),
         E.id,
         E.advisory
    FROM rhnPackageName PN,
         rhnPackageEVR PE,
         rhnPackage P,
         rhnServerNeededCache SNC
           left outer join
          rhnErrata E
            on SNC.errata_id = E.id
   WHERE SNC.package_id = P.id
     AND P.name_id = PN.id
     AND P.evr_id = PE.id
     AND ((lower(pe.release) NOT LIKE '%module+%')
             OR (lower(pe.release) LIKE '%module+%'
             AND regexp_substr(E.synopsis, '[^ ]+:[^ ]+') in (select module_stream
                                                              from rhnservermodulesview
                                                              where server_id = SNC.server_id)));
