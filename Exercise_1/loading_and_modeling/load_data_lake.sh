#/bin/sh
SRC=/root/Exercise1/
DEST=/root/Exercise1/loading_modeling/
# copy to rename & preserve original file
cp $SRC/Hospital*Information.csv $DEST/Hospital.csv

cp $SRC/Timely*Care*Hospital.csv $DEST/Effective_care.csv

cp $SRC/Readmissions*Deaths*Hospital.csv $DEST/Readmissions.csv

cp $SRC/Measure*Dates.csv $DEST/Measures.csv
cp $SRC/hvbp_hcahps_05_28_2015.csv $DEST/Surveys_Responses.csv

#strip the first line
tail -n +2 $DEST/Hospital.csv > $DEST/hospitals.csv
tail -n +2 $DEST/Effective_care.csv > $DEST/effective_care.csv
tail -n +2 $DEST/Readmissions.csv > $DEST/readmissions.csv
tail -n +2 $DEST/Measures.csv > $DEST/measures.csv
tail -n +2 $DEST/Surveys_Responses.csv > $DEST/surveys_responses.csv

#cleanup the datafiles
#Remove commas between double quotes e.g. "ghijk, LLC","foo",
#remove the comma after ghijk.

sed -i -e  ':a;s/^\(\([^"]*,\?\|"[^",]*",\?\)*"[^",]*\),/\1 /;ta' hospitals.csv
sed -i -e  ':a;s/^\(\([^"]*,\?\|"[^",]*",\?\)*"[^",]*\),/\1 /;ta' effective_care.csv
sed -i -e  ':a;s/^\(\([^"]*,\?\|"[^",]*",\?\)*"[^",]*\),/\1 /;ta' readmissions.csv
sed -i -e  ':a;s/^\(\([^"]*,\?\|"[^",]*",\?\)*"[^",]*\),/\1 /;ta' measures.csv
sed -i -e  ':a;s/^\(\([^"]*,\?\|"[^",]*",\?\)*"[^",]*\),/\1 /;ta' surveys_responses.csv

# Create directory /user/raja/hospital_compare
sudo -u hdfs hdfs dfs -mkdir /user/raja/
sudo -u hdfs hdfs dfs -mkdir /user/raja/hospital_compare
sudo -u hdfs hdfs dfs -mkdir /user/raja/hospital_compare/hospitals_data
sudo -u hdfs hdfs dfs -mkdir /user/raja/hospital_compare/effective_care_data
sudo -u hdfs hdfs dfs -mkdir /user/raja/hospital_compare/readmissions_data
sudo -u hdfs hdfs dfs -mkdir /user/raja/hospital_compare/measures_data
sudo -u hdfs hdfs dfs -mkdir /user/raja/hospital_compare/surveys_data


# Load the data into hdfs
cp $DEST/hospitals.csv /tmp
chown hdfs:hdfs /tmp/hospitals.csv
sudo -u hdfs hdfs dfs -put /tmp/hospitals.csv /user/raja/hospital_compare/hospitals_data/hospitals.csv

cp $DEST/effective_care.csv /tmp
chown hdfs:hdfs /tmp/effective_care.csv
sudo -u hdfs hdfs dfs -put /tmp/effective_care.csv /user/raja/hospital_compare/effective_care_data/

cp $DEST/readmissions.csv /tmp
chown hdfs:hdfs /tmp/readmissions.csv
sudo -u hdfs hdfs dfs -put /tmp/readmissions.csv /user/raja/hospital_compare/readmissions_data

cp $DEST/measures.csv /tmp
chown hdfs:hdfs /tmp/measures.csv
sudo -u hdfs hdfs dfs -put /tmp/measures.csv /user/raja/hospital_compare/measures_data/

cp $DEST/surveys_responses.csv /tmp
chown hdfs:hdfs /tmp/surveys_responses.csv
sudo -u hdfs hdfs dfs -put /tmp/surveys_responses.csv /user/raja/hospital_compare/surveys_data

# Verify that the data is there
hdfs dfs -ls /user/raja/hospital_compare/*/*



