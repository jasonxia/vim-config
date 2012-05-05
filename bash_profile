alias ll='ls -al'
alias mvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'
alias mysql-casa-dev="mysql -uroot -hlmdb-casa01.dev.int"
alias mysql-PSeeker-labs='mysql --host=10.112.120.78 --user=readwrite --password='\''labsR3@dwrite'\'' PSeeker'
alias mysql-rea-labs='mysql --host=lmdb-lab01.dev.int.realestate.com.au --user=root --password='\''labs@dmin'\'' rea'
alias mysql-emailAlert-labs='mysql --host=jetwire-lab01.dev.int.realestate.com.au --user=root --password='\''labs@dmin'\'' email_alert'
alias be='bundle exec'
alias mount_ad='/Applications/sshfs/bin/mount_sshfs yxia@ad-dev01.dev.int:/web/home/yxia/agentdesktop ~/REA/agentdesktop'
alias load_vpn='sudo kextload /System/Library/Extensions/CiscoVPN.kext'

alias tomcat='cd ${CATALINA_HOME}'
alias start-tomcat='rm -rf $CATALINA_HOME/work && $CATALINA_HOME/bin/startup.sh'
alias stop-tomcat='$CATALINA_HOME/bin/shutdown.sh'
alias tomcat-log='tail -f ${CATALINA_HOME}/logs/catalina.out'

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export JBOSS_HOME=/Applications/Tools/jboss-soa-p.4.3.0/jboss-as
export TOMCAT_HOME=/Applications/Tools/tomcat-6.0
export MYSQL=/usr/local/mysql
export GEM_HOME=~/.gem
export GEM_PATH=$GEM_HOME
export GROOVY_HOME=/Applications/Tools/groovy-1.8.2
export GRADLE_HOME=/Applications/Tools/gradle-1.0
export CATALINA_HOME=/Applications/Tools/tomcat-6.0
export REBEL_HOME=/Applications/Tools/jrebel
export ACTIVEMQ_HOME=/Applications/Tools/apache-activemq-5.5.1
export MAVEN_OPTS="-Xmx1024m -Xms512m"
export CATALINA_OPTS="-Dcom.sun.management.jmxremote.port=1099 -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false"
export JAVA_OPTS="-Xmx512M -XX:MaxPermSize=160m -Djava.awt.headless=false -ea:com.localmatters... -ea:com.aptas... -Dfile.encoding=UTF-8 -Dorg.apache.tomcat.util.buf.UDecoder.ALLO"
export ARCHFLAGS="-arch x86_64"
export PATH=/opt/local/bin:/opt/local/sbin:$HOME/bin:$MYSQL/bin:$GEM_HOME/bin:$JMETER/bin:$GRADLE_HOME/bin:$GROOVY_HOME/bin:$REBEL_HOME/bin:$PATH

function git_branch {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
    echo "("${ref#refs/heads/}") ";
}
PS1="G'Day!\u [\[\033[1;32m\]\w\[\033[0m] \[\033[0m\]\[\033[1;36m\]\$(git_branch)\[\033[0m\]$ "

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -s "$HOME/.nvm/nvm.sh" ]] && source "$HOME/.nvm/nvm.sh"

pushd ~/toolbox/mysql/aliases >  /dev/null
# use my ~/.my.cfg too!
./bash | sed 's/--defaults-file=/--defaults-extra-file=/' > /tmp/${USER}-aliases
source /tmp/${USER}-aliases
rm /tmp/${USER}-aliases
source ~/REA/bash/mysql/aliases/bash
popd > /dev/null
source /Users/yongmin_xia/REA/cp-auth/script/app-config.sh
