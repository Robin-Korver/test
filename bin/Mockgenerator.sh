# $1 = sourcePath
# $2 = interfaces
# $3 = mocksClassName
# $4 = targetPath
# $5 = apiVersion
# ex : bash dev-tools/Mockgenerator.sh "./ss-library/main/services/classes/interfaces/" "./serviceinterfacemocks.properties"  "ServiceMocks" "./ss-library/main/test/classes/" "44.0"
# bash dev-tools/Mockgenerator.sh "./ss-library/main/domains/classes/interfaces/" "./domaininterfacemocks.properties"  "DomainMocks" "./ss-library/main/test/classes/" "44.0"
# bash dev-tools/Mockgenerator.sh "./ss-library/main/selectors/classes/interfaces/" "./selectorinterfacemocks.properties"  "SelectorMocks" "./ss-library/main/test/classes/" "44.0"
java -jar ./dev-tools/apex-mocks-generator-4.0.1.jar $1 $2 $3 $4 $5
