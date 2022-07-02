### NB : dont add $ to your commands, the $ indicates that its a command

check for an ssh key ::
git bash: type this
`$ ls -al ~/.ssh`
if :
you see these:
id_rsa.pub
id_ecdsa.pub
id_ed25519.pub

        then you have the keys all you have to do is to upload them: goto line

else:
you need to generate a new key
goto line 19

2.  generating a new ssh key::
    git bash then type:
    $ssh-keygen -t ed25519 -C "your_email@example.com"
    if:
    you are using a legacy system use:
    $ ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
    this will create a new SSH key with the email attached
    but it will ask you some things just key pressing enter or if you understand, do otherwise

3.  adding the ssh key to the ssh agent::
    git bash and type in this: 1) $eval "$(ssh-agent -s)"

        2) ssh-add ~/.ssh/id_ed25519

4.  adding the ssh key to your guthub account::
    a) using the website::
    copy the ssh key using::
    $ clip < ~/.ssh/id_ed25519.pub
    goto your github account > settings > Acess>New SSH key or Add SSH key
    in the title, you can add a description like, macbook key, or windows key
    in the key `paste` what you copied using CTRL + V
    then click ` add SSH key`
    then confirm your password

5.test
type in this:
$ ssh -T git@github.com
you will see a warningm=, ignore it
