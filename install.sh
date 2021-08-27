#!/bin/bash

SELF=`basename "$0"`


# read options
TEMP=`getopt -q -o h::d::y:: --long help::,dest::,version::,use-rm::,yes:: -- "$@"`

if [ $? -ne 0 ] ; then
   printf "Unknown option \`$1'. Abort.\n" ; exit 1 ;
fi 

eval set -- "$TEMP"

declare -a BLACKLIST=("\.gitignore" "LICENSE" "$SELF" "README\.md" "etc")

LEN=${#BLACKLIST[@]}
for (( i=0; i<$LEN - 1; i++ )) ; do
   IGNORE_LIST="$IGNORE_LIST${BLACKLIST[$i]}\|" 
done

IGNORE_LIST="$IGNORE_LIST${BLACKLIST[$LEN - 1]}"


TRASH_INFO="\`trash-put' is part of trash-cli at https://github.com/andreafrancia/trash-cli\n
Prebuilt packages are available for nearly every Linux distro." ;

USAGE="Usage:  ./installer.sh [OPTIONS]
         
Installer for EmDash00's personal dotfile collection
         
Options:
  --version       Print version and quit
  -h, --help      Display this help message
  -d, --dest      Specifies a nondefault linking destination
  -y, --yes       Say yes to all nonwarning prompts.
  --use-rm        Delete conflicting files. Silences warnings about trash-put.\n";



while true ; do
   case "$1" in
      -h|--help)
         if [ -z ${FIRST+x} ] ; then
            printf "$USAGE" ; exit ;
         fi
         shift 1 ;;
      --version)
         if [ -z ${FIRST+x} ] ; then
            printf "EmDash00 Dotfile Installer\nversion 1.0 2020-06-01\n" ; exit ;
         fi 
         shift 1 ;;
      -d|--dest)
         FIRST="FIRST" ;
         DEST=$2 ; shift 2 ;;
      --use-rm)
         FIRST="FIRST" ;
         RM="RM" ;
         shift 2 ;;
      -y|--yes)
         FIRST="FIRST" ;
         YES="YES" ;
         shift 2 ;;

      --) shift ; break ;; 
      * ) break ;;
   esac
done


printf "\n"

if [ -z ${DEST+x} ] ; then
   printf "Using default location: $HOME\n" ;
else
   printf "Using location: $DEST\n" ;
fi

if [ -z ${RM+x} ] ; then
   command -v foo >/dev/null 2>&1 || { 
      NOTRASH="NOTRASH" ;
      RM="RM" ;
      printf "\n\nWarning: \`trash-put' but is not installed.\nConflicting directories will be DELETED PERMENANTLY!\n\n" ;
   }
fi

if [ -z ${YES+x} ] && [ -n ${NOTRASH+x} ]; then
   while true ; do
      read -p "Are you sure you wish to proceed? (y/n): " yn
      case $yn in
         [Yy]* ) break ;;
         [Nn]* ) 
            if [ -z ${NOTRASH+x} ] ; then
               printf "\n$TRASH_INFO" ;
            fi
            exit ;;
         * ) printf "Abort.\n" ; exit 1 ;;
      esac
   done
fi

for file in `ls -p --group-directories-first --color=auto -d \
             $(git ls-tree $(git branch | grep \* | cut -d " " -f2) --name-only) | \
             grep -v "/" | grep -v "$IGNORE_LIST"` ;  do 
   if [ -f "$DEST/$file" ] ; then
      if [ -n $RM ] ; then
         `rm --preserve-root "$DEST/$file"`
      else
         `trash-put "$DEST/$file"`
      fi
   fi
   `ln -s $file -t $DEST`
done
