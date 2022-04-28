```bash
#!/system/bin/sh

# Wrapper for curl https validation for curl..

CACERT_BUNDLE=/system/xbin/local/bin/curl/ssl/certs/ca-bundle.crt
curl --cacert ${CACERT_BUNDLE} ${@}
```
