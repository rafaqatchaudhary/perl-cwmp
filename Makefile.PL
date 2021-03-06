use lib './lib';

use inc::Module::Install;

name		'CWMP';
version_from 'lib/CWMP/Server.pm';
license		'GPL';
requires	'XML::Bare';
requires	'XML::Generator';
requires	'Data::Dump';
requires	'Carp';
requires	'Class::Accessor';
requires	'Net::HTTP';
requires	'Cwd';
requires	'File::Slurp';
requires	'Getopt::Long';
#requires	'Term::Shelly'	=>	'0.03';
requires	'Module::Pluggable';
requires	'Hash::Merge';
requires	'IPC::DirQueue';
requires	'File::Spec';
requires	'File::Path';
#requires	'Class::Trigger';
requires	'File::Find';

build_requires 'Test::More';

features(
	'CWMP::Store::YAML' => [
		-default => 1,
		'YAML::Syck' => 0.91,
	],
	'CWMP::Store::JSON' => [
		-default => 0,
		'JSON::XS' => 2.0,
	],
	'Command-line access to Thompson modems (tcli.pl)' => [
		-default => 0,
		'Expect',
		'Net::Telnet',
	],
	'Trigger TR-069 implementation over Web on ZTE' => [
		-default => 0,
		'WWW::Mechanize',
	],
	'HTML documentation (make html)' => [
		-default => 0,
		'Pod::Xhtml',
	],
	'Pod coverage tests (for developers)' => [
		-default => 0,
		'Test::Pod::Coverage',
	],
#	'Memory leak detection (for developers)' => [
#		-default => 0,
#		'Devel::LeakTrace::Fast' => 0.11,
#	],
);

my_targets();

clean_files('dump/* yaml state.db html t/var/* queue');

auto_install;

WriteAll;
