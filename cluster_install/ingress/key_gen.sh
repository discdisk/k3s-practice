openssl req -x509 -newkey rsa:2048 -out MyCompanyCA.cer -outform PEM -keyout MyCompanyCA.pvk -days 10000 -verbose -config myCA.cnf -nodes -sha256 -subj "/CN=MyCompany CA"

openssl req -newkey rsa:2048 -keyout MyCompanyLocalhost.pvk -out MyCompanyLocalhost.req -subj /CN=mongo.my-service.com -sha256 -nodes
openssl x509 -req -CA MyCompanyCA.cer -CAkey MyCompanyCA.pvk -in MyCompanyLocalhost.req -out MyCompanyLocalhost.cer -days 10000 -extfile myserver.ext -sha256 -set_serial 0x1111

kubectl create secret tls test-tls \
    --namespace default  \
    --key MyCompanyLocalhost.pvk \
    --cert MyCompanyLocalhost.cer

mv My* tls_generate
mv my* tls_generate
