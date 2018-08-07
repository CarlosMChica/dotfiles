{ fetchFromGitHub, python27Packages, imagemagick, libnotify, python, intltool, makeWrapper, gtk3, gobjectIntrospection, wrapGAppsHook, gnome3 }:

python27Packages.buildPythonPackage rec {
  name = "variety";
  version = "0.6.9";
  src = fetchFromGitHub {
    owner = "varietywalls";
    repo = "variety";
    rev = version;
    sha256 = "0dqw3p6psgdb2f5l6diyas6ghkn8mfl8md3f9wc714y7zbvhsaiz";
  };
  pythonEnv = python.withPackages(ps: with ps; [
    dbus-python
    notify2
    distutils_extra
    requests
    pycurl
    beautifulsoup4
    configobj
    httplib2
    pillow
    lxml
    helper]
  );

  propagatedBuildInputs = with python27Packages; [
    dbus-python
    pythonEnv
    gtk3
  ];

  nativeBuildInputs = [
    gobjectIntrospection # populate GI_TYPELIB_PATH
    wrapGAppsHook
  ];

  buildInputs = [
    gnome3.gexiv2
    pythonEnv
    gtk3
    libnotify
    imagemagick
    intltool
    makeWrapper
  ];
  doCheck = false;
}
