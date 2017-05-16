FROM armhf/debian:wheezy-slim

RUN set -ex \
	&& export DEBIAN_FRONTEND='noninteractive' \
	&& apt-get update && apt-get install -y --no-install-recommends --no-install-suggests \
		samba-common-bin swat

COPY smb.conf /tmp/

ARG USER
ARG PASS

RUN set -ex \
	&& cp /etc/samba/smb.conf /etc/samba/smb.ori.conf \
	&& cp /tmp/smb.conf /etc/samba/smb.conf \
	&& touch /etc/printcap \

	&& adduser --system --no-create-home --uid 1000 --group "$USER" \
	&& printf "$PASS\n$PASS\n" | $(which smbpasswd) -a "$USER" \
	&& printf "root:$PASS\nandry:$PASS\n" | chpasswd
