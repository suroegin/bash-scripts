# You must to launch it under not-root user. 

echo "\nFolder you have are:"
ll /home/$USER/projects/

echo "Choose folder name, please:"
read folder
echo "\nEnter name of new project (without spaces and not standard symbols, please)"
read projectname

sudo mkdir -p /home/$USER/projects/$folder/$projectname
echo "\n/home/$USER/projects/$folder/$projectname directory is created."

sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/$folder-$projectname
sudo nano /etc/nginx/sites-available/$folder-$projectname
sudo ln -s /etc/nginx/sites-available/$folder-$projectname /etc/nginx/sites-enabled/$folder-$projectname
sudo service nginx restart

echo "Now you can upload project to: /home/$USER/projects/$folder/$projectname"
