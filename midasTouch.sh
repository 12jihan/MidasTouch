#!/bin/sh

# Author : Jareem E. Hoff
# Copyright (c) Tutorialspoint.com
# Script follows here:
midastouch() {
    echo $0
    echo "what do you want to name your project? "
    read -r name

    printf "is %s ok as a project name? " Jeh${name^}Tool
    read -p "Yes (y) or No (n): " -r answer

    if [ $answer == "y" ] || [ $answer == "Y" ]; then
        if [ ${#name} -gt 0 ]; then
            name="Jeh${name^}Tool"
            echo "$name Project Created!"
            cd "../"
            mkdir -p "./$name/src/main/"
            mkdir -p "./$name/src/test/"

            app_loc="./$name/src/main/App.java"
            app_test_loc="./$name/src/test/AppTest.java"
            readme_loc="./$name/README.md"
            gitignore_loc="./$name/.gitignore"

            touch $app_loc
            touch $app_test_loc
            touch $readme_loc
            touch $gitignore_loc

            printf "package main;\n\npublic class App {\n\tpublic static void main(String[] args) {\n\t\tSystem.out.println(\"Hello World!\");\n\t}\n}\n" > $app_loc
            printf "package test;\n\npublic class AppTest {\n\tpublic static void main(String[] args) {\n\t\tSystem.out.println(\"Hello World!\");\n\t}\n}\n" > $app_test_loc
            printf "./README.md\n" >> $gitignore_loc
            printf "./.gitignore" >> $gitignore_loc

            ls -la
            cd "$name" && ls -la
            git init
            echo "Happy Hacking!"
        else
            echo "Please choose make sure you type a name"
            echo "Try again..."
            echo "Aborting..."
        fi
    else
        echo "Aborting..."
    fi
}

midastouch