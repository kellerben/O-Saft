#!/bin/cat
#?
#? NAME
#?      .o-saft.pl  -  resource file for o-saft.pl
#? DESCRIPTION
#?      Contains arguments and options for o-saft.pl .
#? SYNOPSIS
#?      File must be located in current working directory or installation
#?      directory of  o-saft.pl .
#? SYNTAX
#?      Empty lines are ignored.
#?      Lines starting with  #  are ignored (comment lines).
#?      Each other line will be passed as one single argument or option.
#?      Note that all values for  --cfg-cmd=  are all lower case letters.
#?

###
### force to use private openssl
###
#--openssl=/usr/local/bin/openssl
#--force-openssl 
### or
#--lib=/usr/local/lib

### disable special openssl options
#--no-nextproto
#--no-reconnect
#--no-tlsextdebug

###
### specify CA bundle
###
#--ca-file=/etc/ssl/certs/ca-certificates.crt
#--ca-depth=4

###
### disable cipher checks
###
#--no-sslv2
#--no-sslv3
#--no-tlsv1
#--no-tlsv11
#--no-tlsv12
#--no-tlsv13
#--no-dtlsv1

###
### avoid various problems
###
#--ssl-lazy
#--no-http
#--no-sni
#--no-dns
#--no-md5-cipher
#--no-cert
#--ignorecase

###
### make output parsable
###
#--short
#--showhost
#--trace=key
#--no-header
#--no-warning
#--separator=CHAR
#--enabled

###
### reconfigure list of check for special commands (+http +check ...)
###
# The default behaviour to print the results is to loop over the list of hash
# keys. This is usually a sorted alphanumerically according the key name. For
# human readability, the default behaviour  may not be appropriate. Hence the
# sequence of the output can be sorted as needed. Therefore simply define the
# commands to be used below. They then will be printed in that order.
#
# NOTE that the list defined here overwrites o-saft.pl's default list, which
#      can result in missing output.
# Hint: use --tracekey which prints the keys

###
### redefine command +http
###
--cfg_cmd=http=http_status http_location http_refresh http_sts https_status https_server https_location https_refresh https_alerts https_sts hsts_maxage hsts_subdom http_https hsts_is301 hsts_is30x hsts_redirect hsts_fqdn hsts_sts hsts_location hsts_refresh sts_maxage sts_subdom sts_maxage0d sts_maxage1d sts_maxage1m sts_maxage1y sts_maxagexy https_pins pkp_pins http pfs

###
### redefine command +info
###
--cfg_cmd=info=certversion cn subject subject_hash issuer issuer_hash serial fingerprint fingerprint_type fingerprint_hash fingerprint_sha1 fingerprint_md5 before after dates email certificate sigdump signame sigkey_len sigkey_value pubkey pubkey_algorithm modulus_len pubkey_value modulus_exponent aux trustout ocspid ocsp_uri selfsigned chain chain_verify extensions altname verify_altname verify_hostname verify error_verify heartbeat expansion compression renegotiation resumption srp krb5 psk_identity psk_hint protocols master_key session_id session_ticket sslversion http_status http_location http_refresh http_sts https_server https_status https_location https_refresh https_alerts https_sts hsts_maxage hsts_subdom http_https hsts_is301 hsts_is30x hsts_redirect hsts_fqdn hsts_sts hsts_location hsts_refresh sts_maxage sts_subdom sts_maxage0d sts_maxage1d sts_maxage1m sts_maxage1y sts_maxagexy https_pins pkp_pins info
# useless for +info ('cause aliases): issuer issuer_hash
# included in +info to be printed with --v :
#      certificate sigdump pubkey extensions ext_*
#      ext_* printed with +info--v

###
### redefine command +check
###
--cfg_cmd=check=selected cnt_totals hassslv2 hassslv3 order adh export null rc4 edh pfs ism pci fips tr-02102 bsi-tr-02102+ bsi-tr-02102- beast breach crime time heartbleed poodle sni hostname reversehost cps crl ev+ ev- ev-chars crnlnull nonprint ocsp fp_not_md5 sha2signature expired dates rootcert selfsigned constraints verify certfqdn wildcard wildhost sernumber http_https hsts_is301 hsts_is30x hsts_redirect hsts_fqdn hsts_sts hsts_location hsts_refresh sts_maxage sts_subdom sts_maxage0d sts_maxage1d sts_maxage1m sts_maxage1y sts_maxagexy pkp_pins krb5 psk_identity psk_hint master_key session_id session_ticket closure sgc zlib open_pgp lzo fallback renegotiation resumption srp scsv cnt_altname cnt_chaindepth cnt_ciphers cnt_wildcard len_cps len_crl len_crl_data len_ocsp len_oids len_altname len_chain len_issuer len_pembase64 len_pembinary len_publickey len_sigdump len_subject len_sernumber check
# useless for +check:    ip
# don't use   +check:   (SSLv|TLSv)*

###
### redefine command +quick
###
--cfg_cmd=quick=selected cipher sslversion hassslv2 hassslv3 export rc4 pfs beast crime heartbleed poodle fingerprint_hash fp_not_md5 sha2signature email serial subject dates verify heartbeat expansion compression hostname tr-02102 bsi-tr-02102+ bsi-tr-02102- hsts_sts crl resumption renegotiation

###
### redefine texts
###
# Syntax
#     --cfg_text=KEY=VALUE
#
# the new (VALUE) string consist of all characters right to left-most =
# all \n, \r and \t will be replace by corresponding character
#
# NOTE that @@ is a placeholder and will be replaced with actual value
# NOTE that charater = will be lost if it is the last character in line
#      workaround: add space or \t
#
#--cfg_text=cert-chars= <<nicht erlaubte Zeichen in @@>>
#--cfg_text=cert-dates= <<ungültiges Datum des Zertifikats>>
#--cfg_text=cert-valid= <<Gültigkeitsdauer des Zertifikats zu groß @@>>
#--cfg_text=cipher=Schlüssel
#--cfg_text=desc=Beschreibung
#--cfg_text=desc-check=Prüfergebnis (ja ist gut)
#--cfg_text=desc-info=Wert
#--cfg_text=desc-score=Score (max. Wert 100)
#--cfg_text=disabled=<<Test deaktiviert>>
#--cfg_text=EV-large= <<@@ zu groß>>
#--cfg_text=EV-miss= <<@@ fehlt>>
#--cfg_text=gethost= <<gethostbyaddr() failed>>
#--cfg_text=host-DNS=DNS Einträge für übergebenen Hostnamen
#--cfg_text=host-host=Übergebener Hostname
#--cfg_text=host-IP=IP des übergebenen Hostnamens
#--cfg_text=host-rhost=Reverse resolved Hostname
#--cfg_text=miss-ECDSA= <<Schlüssel ECDHE-ECDSA-* fehlt>>
#--cfg_text=miss-RSA= <<Schlüssel ECDHE-RSA-* fehlt>>
#--cfg_text=need-cipher=<<Prüfung nur in Verbindung mit `+cipher' möglich>>
#--cfg_text=no-cert=<<N/A da --no-cert verwendet>>
#--cfg_text=no-dns=<<N/A da --no-dns verwendet>>
#--cfg_text=no-http=<<N/A da --no-http verwendet>>
#--cfg_text=no-tlsextdebug= <<N/A da --no-tlsextdebug verwendet>>
#--cfg_text=no-reneg= <<secure renegotiation nicht unterstützt>>
#--cfg_text=no-STS=<<N/A da STS nicht gesetzt>>
#--cfg_text=out-checks=\n=== Prüfungen === 
#--cfg_text=out-ciphers=\n=== Schlüssel: prüfe @@ === 
#--cfg_text=out-infos=\n=== Informationen === 
#--cfg_text=out-list==== Liste @@ Schlüssel === 
#--cfg_text=out-scoring=\n=== Bewertung === 
#--cfg_text=out-summary=== Schlüssel: Zusammenfassung @@ == 
#--cfg_text=out-target=\n==== Zielsystem: @@ ====\n
#--cfg_text=protocol=<<Protokol evt. angeboten, es werden aber keine Schlüssel akzeptiert>>
#--cfg_text=response=<<Antwort>>
#--cfg_text=security=Sicherheit
#--cfg_text=support=angeboten
#--cfg_text=undef=<<undefiniert>>
#--cfg_text=wildcards= <<verwendet Wildcards:

