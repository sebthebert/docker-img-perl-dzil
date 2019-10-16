FROM alpine:3.10

RUN apk update \
 && apk add ca-certificates wget \
 && update-ca-certificates

RUN apk add gcc git make musl-dev openssl openssl-dev \
    perl perl-dev perl-app-cpanminus perl-net-ssleay

RUN cpanm -n \
    Devel::Cover::Report::Coveralls \
    Dist::Zilla \
    Dist::Zilla::App::Command::cover \
    Dist::Zilla::Plugin::CheckChangeLog \
    Dist::Zilla::Plugin::ExtraTests \
    Dist::Zilla::Plugin::GitHub::Meta \
    Dist::Zilla::Plugin::MetaProvides::Package \
    Dist::Zilla::Plugin::MinimumPerl \
    Dist::Zilla::Plugin::PerlTidy \
    Dist::Zilla::Plugin::PodCoverageTests \
    Dist::Zilla::Plugin::PodSyntaxTests \
    Dist::Zilla::Plugin::RewriteVersion \
    Dist::Zilla::Plugin::Test::Kwalitee \
    Dist::Zilla::Plugin::Test::Kwalitee::Extra \
    Dist::Zilla::Plugin::Test::Perl::Critic \
    Dist::Zilla::Plugin::Test::Portability \
    Dist::Zilla::Plugin::Test::UnusedVars
