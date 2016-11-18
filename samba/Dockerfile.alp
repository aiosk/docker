FROM alpine

WORKDIR /root

RUN set -ex \
	&& apk --no-cache add samba samba-common-tools

COPY smb.conf.default ./smb.conf
RUN set -ex \
	&& addgroup andry \
	&& adduser -DG andry andry && echo 'yosua' | passwd -d andry \

	&& touch /var/lib/samba/winbindd_idmap.tdb \
	&& touch /var/lib/samba/registry.tdb \
	&& touch /var/lib/samba/account_policy.tdb \

	&& echo 'yosuasamba' | tee - | $(which smbpasswd) -c ./smb.conf -D 3 -a andry

