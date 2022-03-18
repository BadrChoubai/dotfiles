my $dotfiles = $ENV{'DOTFILES'};
$path = "$dotfiles/uses";

opendir(PACKAGES, $path) || die "Can't open directory: $path";
my @list = grep !/^\.\.?$/, readdir(PACKAGES);
closedir PACKAGES;

print join(",", @list);
