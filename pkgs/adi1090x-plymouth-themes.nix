{
	lib,
	fetchFromGitHub,
	stdenvNoCC,
	pkgs
} :

let
	available = [
		"circuit"
		"colorful_sliced"
	];

in
stdenvNoCC.mkDerivation rec {
	pname = "adi1090x-plymouth-themes";
	version = "0.1.0";
	dontBuild = true;

  src = fetchFromGitHub {
		owner = "adi1090x";
		repo = "plymouth-themes";
		rev = "bf2f570bee8e84c5c20caac353cbe1d811a4745f";
		sha256 = "VNGvA8ujwjpC2rTVZKrXni2GjfiZk7AgAn4ZB4Baj2k=";
  };

	outputs = available ++ [ "out" ];
	outputsToInstall = [];

  installPhase = ''
		runHook preInstall

		for output in $(getAllOutputNames); do
			if [ "$output" != "out" ]; then
				local outputDir="''${!output}"
				echo $outputDir
				local themeDir="$outputDir"/share/plymouth/themes

				mkdir -p "$themeDir"

				cp -r pack_1/$output $themeDir/
				cat pack_1/$output/$output.plymouth | sed  "s@\/usr\/@$outputDir\/@" > $themeDir/$output/$output.plymouth
			fi
		done
		# Needed to prevent breakage
		mkdir -p "$out"

		runHook postInstall
  '';

	meta = with lib; {
		description = "Installs specific themes from adi1090x";
		homepage = "https://github.com/adi1090x/plymouth-themes";
		license = licenses.gpl3;
		platforms = platforms.all;
	};
}
