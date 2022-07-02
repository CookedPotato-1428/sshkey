
### For more info visit [GitHub docs](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)

# *CREATING AND ADDING YOUR SSH KEY TO GITHUB*   <img src="https://myoctocat.com/assets/images/base-octocat.svg" height = '60' width = '30' /> 

## Check for an ssh key ::

open __git bash__ and type : 
```
 ls -al ~/.ssh
```
<b> if you see these: </b><br/>
  ***id_rsa.pub***<br/>
  ***id_ecdsa.pub***<br/>
  ***id_ed25519.pub***<br/>

then you have the keys all you have to do is to *link the key*.<br/>
<b>else if you don't </b><br/>
then you need to generate a new key

##  Generating a new ssh key if you didn't find one

in __git bash__ type : 
```
    ssh-keygen -t ed25519 -C "your_email@example.com"
```   

__if you are using a legacy system use:(if you dont know just use the one above)__
```
    ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```
 
<p>this will create a new SSH key with the email attached
    but it will ask you some things, just keep pressing enter or you can do otherwise</p>

##  Adding the SSH key to the SSH agent::

in __git bash__ type : 
```
eval "$(ssh-agent -s)" 
ssh-add ~/.ssh/id_ed25519
```

# Adding the SSH key to your GitHub account

1.using the website:

<b>copy the ssh key using</b> in <b>git bash</b>  : 
```
clip < ~/.ssh/id_ed25519.pub
```
<p>
Go to your github page<br/>
In the upper-right corner of any page, click your profile photo, then click Settings > Acess
<div>
<img src="https://docs.github.com/assets/cb-34573/images/help/settings/userbar-account-settings.png" align="bottom" height="200" width="100"/>
</div>
</p>
<br/>

<p>
New SSH key or Add SSH key
<div>
<img src="https://docs.github.com/assets/cb-11964/images/help/settings/ssh-add-ssh-key.png" align="bottom" height="150" width="350"/>
</div>
</p>
<br/>
<p>
In the title, you can add a description like, macbook key, or windows key and in the key `paste` what you copied using CTRL + V
<div>
<img src="https://docs.github.com/assets/cb-24796/images/help/settings/ssh-key-paste.png" align="bottom" height="300" width="400"/>
</div>
</p>
<br/>
<p>
then click <b>add SSH key</b>
<div>
<img src = "https://docs.github.com/assets/cb-2803/images/help/settings/ssh-add-key.png" height ="100" width="200" align = "bottom"/>
</div>
then input your <b>password</b> to confirm
<div>
<img src="https://docs.github.com/assets/cb-14481/images/help/settings/sudo_mode_popup.png" height="200" width="300" align="bottom"/>
</div>
</p>

2.using the (cli tool) <b>git-bash</b> visit the [GitHub Docs(Adding a new SSH key to your GitHub account using the cli tool)](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account) for more detailed info and instructions
# Testing if it worked
in <b>git bash</b> type : 
```
ssh -T git@github.com
```

you will see a this

```
> The authenticity of host 'github.com (IP ADDRESS)' can't be established.
> RSA key fingerprint is SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8.
> Are you sure you want to continue connecting (yes/no)?
```

Verify that the fingerprint in the message you see matches GitHub's public key fingerprint. If it does, then type ``` yes ```
<br/>
the you will see this 
```
> Hi username! You've successfully authenticated, but GitHub does not
> provide shell access.
```
where ``` username ``` is your username<img src="https://myoctocat.com/assets/images/base-octocat.svg" height = '20' width = '10' /> 

## If all works Yay you have successfully linked your github cli tool to your github account

# Happy PUSHING!🙂🙂
<br/>

###### images gotten from the [GITHUB DOCS](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/about-ssh)
