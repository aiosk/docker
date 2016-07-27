FROM alpine

WORKDIR /root

RUN set -ex \
	&& runDeps='samba samba-common-tools bash sed' \
	&& apk --no-cache add $runDeps

RUN set -ex \
	&& addgroup andry \
	&& adduser -DG andry andry && echo 'yosua' | passwd -d andry \

	&& touch /etc/samba/smbpasswd \
	&& touch /var/lib/samba/registry.tdb \
	&& touch /var/lib/samba/account_policy.tdb \
	&& touch /var/lib/samba/winbindd_idmap.tdb

COPY smb.conf.default ./smb.conf
COPY init.sh ./samba.sh
COPY lib.sh ./lib.sh
