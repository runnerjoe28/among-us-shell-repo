# List of files to copy to ~/ to update bash
# Enables development in separate and contained folder
# Note, the "-i" flag is not used as there may be alot of files copied
# Please be careful before running this script as it will override files

# Copy over key bash files
for file in {.bash_aliases,.bash_extra,.bash_prompt,.bash_profile,.bashrc,.bash_logout}; do
	[ -r "$file" ] && [ -f "$file" ] && cp -f -v ./$file ~/$file;
done;
unset file;

# Copy over supporting directories
for dir in {.bash_more,}; do
	cp -f -R -v ./$dir ~/;
done;
unset dir;