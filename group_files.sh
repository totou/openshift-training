new_file="all.yaml"
separator="---"
rm -f ${new_file}
touch ${1}/${new_file}
for file in `ls $1`
do
    cat ${file} >> ${new_file}
    echo ${separator} >> ${new_file}
done
