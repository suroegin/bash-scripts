# You must to launch it under not-root user. 

echo -n "Paste ip-address of this server"
read IP_ADDR
IP_ADDRESS=$IP_ADDR
USERNAME=$USER

/bin/mkdir -p /home/$USERNAME/projects
echo "Folders which $USERNAME have in /projects"
/bin/ls -alF /home/$USERNAME/projects

echo "Folder name - is a folder of a types of projects. Types:"
echo "    With Python: pyWEB | pyBOTS | pySCRIPTS | pyPARSER | pyNOTEBOOKS"
echo "    With R: rSCRIPTS | rPARSER | rNOTEBOOKS"
echo "    With Javascript: jsWEB | jsBOTS | jsSCRIPTS | jsPARSER"
echo "    Simple static sites: htmlSITES | mkSITES"
echo "    Temporary small projects or scripts: TEMPORARY" 

echo -n "\nFolder name?"
read FOLDER_NAME
echo -n "\nEnter name of new project (without spaces and not standard symbols, please)"
read PROJECT_NAME

/bin/mkdir -p /home/$USERNAME/projects/$FOLDER_NAME/$PROJECT_NAME
echo "\n/home/$USER/projects/$FOLDER_NAME/$PROJECT_NAME directory is created."

sudo /bin/cp /etc/nginx/sites-available/default /etc/nginx/sites-available/$FOLDER_NAME-$PROJECT_NAME

sudo /bin/cat <<FOO > /etc/nginx/sites-available/$FOLDER_NAME-$PROJECT_NAME
server {
    listen 80;
    server_name $IP_ADDRESS;
    root /home/$USERNAME/projects/$FOLDER_NAME/$PROJECT_NAME;
    location / {
        try_files $uri =404;
    }
}
FOO


sudo /bin/ln -s /etc/nginx/sites-available/$FOLDER_NAME-$PROJECT_NAME /etc/nginx/sites-enabled/$FOLDER_NAME-$PROJECT_NAME
sudo /usr/sbin/service nginx restart

echo "Now you can upload project to: /home/$USERNAME/projects/$FOLDER_NAME/$PROJECT_NAME"
