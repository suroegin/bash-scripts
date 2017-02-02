# You must to launch it under not-root user. 

IP_ADDRESS=$(hostname -i | awk '{print $2}')
USERNAME=$USER

echo "Folders which $USERNAME have in /projects"
/bin/ls -alF /home/$USERNAME/projects

echo "Choose folder name, please:"
read FOLDER_NAME
echo "\nEnter name of new project (without spaces and not standard symbols, please)"
read PROJECT_NAME

/bin/mkdir -p /home/$USERNAME/projects/$FOLDER_NAME/$PROJECT_NAME
echo "\n/home/$USER/projects/$FOLDER_NAME/$PROJECT_NAME directory is created."

sudo /bin/cp /etc/nginx/sites-available/default /etc/nginx/sites-available/$FOLDER_NAME-$PROJECT_NAME

sudo /bin/cat > /etc/nginx/sites-available/$FOLDER_NAME-$PROJECT_NAME <<FOO
server {
    listen 80;
    server_name $IP_ADDRESS;
    root /home/$USERNAME/projects/$FOLDER_NAME/$PROJECT_NAME;

    location / {
        try_files $uri =404;                                                                         }

    }
}
FOO


sudo /bin/ln -s /etc/nginx/sites-available/$FOLDER_NAME-$PROJECT_NAME /etc/nginx/sites-enabled/$FOLDER_NAME-$PROJECT_NAME
sudo /usr/sbin/service nginx restart

echo "Now you can upload project to: /home/$USERNAME/projects/$FOLDER_NAME/$PROJECT_NAME"
