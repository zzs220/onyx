{ pkgs, ... }: 
{
  home.packages = with pkgs; [
  	nyaa transmission_4 rustmission
  ];
}
