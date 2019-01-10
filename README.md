# A collection of bash scripts that've saved me time. 

### Structure:
- Any folder that requires files to be in the current directory, or writes a file, has it's own folder.
- Any script that doesn't write files and requires no files is contained in the scripts folder, with the exception of the update_readme script in this current directory. 


### Scripts:
- htaccess-cloudflare: creates an .htaccess file that locks down a web server to cloudflares resolvers, in case you don't have the ability to deny outside traffic at a lower level.
- openvpn_config: creates a universal ovpn client configuration.
- scripts/replace_git_contributor.sh: rewrites the email and username on each commit to migrate old projects to a new github.
