Name: stata-png-fix
License: GPL
Group: Statistics
Summary: Fixes Stata png bug on openSUSE 13.1
URL: https://bitbucket.org/vilhuberl/stata-png-fix
Packager: Lars Vilhuber <lars.vilhuber@cornell.edu>
Version: 1.0
Release: 0
Source0: stata-png-fix.libs.tgz

BuildRoot: %{_tmppath}/%{name}-%{version}-build 
BuildArch: noarch


%description
Fixes Stata png bug on openSUSE 13.1

%prep

%build
tar xzf %{source0}

%install
# the actual application
cd %buildroot
install -d -m 755 -g root -o root %buildroot/usr/local/%{name}
install -m 0755 -o root -g users stata-png-fixed.sh %buildroot/usr/local/%{name}/stata-png-fixed.sh

ln -s %buildroot/usr/local/%{name}/stata-png-fixed.sh %buildroot/usr/local/bin/xstata
ln -s %buildroot/usr/local/%{name}/stata-png-fixed.sh %buildroot/usr/local/bin/xstata-se
ln -s %buildroot/usr/local/%{name}/stata-png-fixed.sh %buildroot/usr/local/bin/xstata-mp
ln -s %buildroot/usr/local/%{name}/stata-png-fixed.sh %buildroot/usr/local/bin/xstata-sm

#------------------------------------------------
# after uninstalling, clean up any leftover files
#------------------------------------------------
%postun

%clean


%files
/usr/local/bin/xstata
/usr/local/bin/xstata-se
/usr/local/bin/xstata-mp
/usr/local/bin/xstata-sm
/usr/local/%{name}/

%changelog
* Sat Apr 26 2014 vilhuber@lservices
- First version
