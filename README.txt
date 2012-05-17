Submodules :>
 Add :>
   ~/.vim$ git submodule add https://github.com/ecomba/ctrlp.git bundle/ctrlp

 Use :>
   ~/.vim$ git submodule init && git submodule update

 Remove :>
   * First step is remove references to the submodule in .gitmodules and .git/config
   * Then git rm --cached bundle/ctrlp

