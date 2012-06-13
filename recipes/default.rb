packages = Array.new

case node[:lsb][:codename]
when "lucid"
  packages |= %w/
    perl-modules
  /
when "precise"
  include_recipe "libclass-isa-perl"
  include_recipe "libswitch-perl"

  packages |= %w/
    perl-modules
  /
end

packages.each do |pkg|
  package pkg do
    action [:install, :upgrade]
  end
end
