FROM armbuild/debian:7

WORKDIR /root

RUN set -ex \
	&& export DEBIAN_FRONTEND='noninteractive' \
	&& apt-get update && apt-get install -y --no-install-recommends --no-install-suggests samba-common-bin swat  \
	&& rm -rf /var/lib/apt/lists/* \

	&& apt-get clean -y && apt-get autoclean -y && apt-get autoremove -y \
	&& rm -rf /var/cache/debconf/*-old /usr/share/doc/* /usr/share/man/* /usr/share/groff/* /usr/share/info/* /usr/share/locale/* /tmp/* /var/tmp/*
	
RUN	set -ex \
	&& addgroup --system share \
	&& adduser --system --ingroup share andry && echo 'yosua' | passwd -d andry \

	&& echo "root:yosuasamba" | chpasswd \

	&& cp /etc/samba/smb.conf /etc/samba/smb.conf.ori

COPY smb.conf.default /etc/samba/smb.conf
RUN	set -ex \
	&& touch /var/lib/samba/registry.tdb \
	&& touch /var/lib/samba/winbindd_idmap.tdb \
	&& touch /var/lib/samba/account_policy.tdb \

	&& echo 'yosuasamba' | tee - | $(which smbpasswd) -D 3 -a andry
