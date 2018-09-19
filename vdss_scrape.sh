#!/bin/bash

wget -q -O - "http://dss.virginia.gov/facility/search/cc2.cgi?rm=Search&search_contains_zip=&search_exact_fips=&search_keywords_name=&search_require_client_code-2101=1" >> ~/vdss_centers.html

wget -q -O - "http://dss.virginia.gov/facility/search/cc2.cgi?rm=Search&search_contains_zip=&search_exact_fips=&search_keywords_name=&search_require_client_code-2105=1" >> ~/vdss_religious.html

wget -q -O - "http://dss.virginia.gov/facility/search/cc2.cgi?rm=Search&search_contains_zip=&search_exact_fips=&search_keywords_name=&search_require_client_code-3001=1" >> ~/vdss_center_based.html

wget -q -O - "http://dss.virginia.gov/facility/search/cc2.cgi?rm=Search&search_contains_zip=&search_exact_fips=&search_keywords_name=&search_require_client_code-2102=1" >> ~/vdss_family_home.html

wget -q -O - "http://dss.virginia.gov/facility/search/cc2.cgi?rm=Search&search_contains_zip=&search_exact_fips=&search_keywords_name=&search_require_client_code-2201=1" >> ~/vdss_voluntary_registered.html

wget -q -O - "http://dss.virginia.gov/facility/search/cc2.cgi?rm=Search&search_contains_zip=&search_exact_fips=&search_keywords_name=&search_require_client_code-3002=1&search_require_client_code-3003=1&search_require_client_code-3004=1" >> ~/vdss_home_based.html

wget -q -O - "http://dss.virginia.gov/facility/search/cc2.cgi?rm=Search&search_contains_zip=&search_exact_fips=&search_keywords_name=&search_require_client_code-2106=1" >> ~/vdss_short_term.html

wget -q -O - "http://dss.virginia.gov/facility/search/cc2.cgi?rm=Search&search_contains_zip=&search_exact_fips=&search_keywords_name=&search_require_client_code-2104=1" >> ~/vdss_preschool.html
