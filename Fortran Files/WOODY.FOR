      PROGRAM WODY
c     maximum aantal samples = 999
c     maximum aantal trials = 999
c
c     lag = input parameter voor maximum lag in woody
c     niter = input parameter voor maximum aantal iteraties
c     tresh2 = input parameter
c     nt1 = input parameter: begin te analyseren signaal
c     nt2 = input parameter: eind te analyseren signaal
c     nchan = input parameter: kanaal waarop data staan
c     nout = input parameter: kanaal waarop output staat
c     ns = input parameter: aantal te analyseren trials
c
      COMMON/www/amean(999),B(999),C(999),Z(999),IT(999),IS(999)
      CHARACTER  filein1*30, filein2*30,  fileout*30 
c
      write(*,*) '___________________________________________________'
      write(*,*)
      write(*,*) '                      WOODY FILTER   '                    '
      write(*,*) '___________________________________________________'
      write(*,'(a\)') ' give local name of the paremeter-file (input) '
      read(*,997) filein1
      open(1,file=filein1)
      rewind 1
      write(*,*) 
      write(*,'(a\)') ' give local name of the data-file (input) '
      read(*,997) filein2
      open(2,file=filein2)
      rewind 2
      write(*,'(a\)') ' give name of the output-file '
      read(*,997) fileout
 997  format(30a)
      open(3,file=fileout)
      read(1,*)nt,ns,nt1,nt2
      read(1,*)lag,niter,tresh1,tresh2
      CALL WOODY(nt,nt1,nt2,NS,LAG,NITER,tresh1,tresh2)
      write(3,10)
 10   format(1x,'lag correction per trial')
      do 11 i=1,ns
 11   write(3,12)i,is(i)
 12   format(1x,i3,2x,i7)
      write(3,13)
 13   format(/,1x,'woody filtered signal')
      mt=nt2-nt1+1
      write(3,15)(amean(i),i=1,mt)
 15   format(/,5(1x,f10.3))
      write(3,*)
      stop
      END
      SUBROUTINE WOODY(nt,nt1,nt2,NS,LAG,NITER,tresh1,tresh2)
      COMMON/www/AMEAN(999),B(999),C(999),Z(999),IT(999),IS(999)
      mt=nt2-nt1+1
      DO 10 I=1,NS
      IS(I)=0
 10   C(I)=1
      TRESH=tresh1/SQRT(FLOAT(NT))
      DO 11 II=1,NITER
      REWIND 2
      IFLAG=0
      ILAG=LAG-II+1
      IF(ILAG.LT.1)ILAG=1
      NLAG=2*ILAG+1
      DO 12 I=1,mT
      AMEAN(I)=0
 12   IT(I)=0
      DO 13 I=1,NS
      READ(2,*)(Z(J),J=1,NT)
      B(I)=0
      N=0
      DO 15 J=nt1,nt2
      K=J+IS(I)
      IF(K.LT.nt1.OR.K.GT.NT2)GOTO 15
      B(I)=B(I)+Z(K)
      N=N+1
 15   CONTINUE
      B(I)=B(I)/N
      IF(C(I).LT.TRESH)GOTO 13
      DO 16 J=1,mT
      K=J+IS(I)+nt1-1
c
      if(k.lt.nt1.or.k.gt.nt2)goto 16
c
      AMEAN(J)=AMEAN(J)+Z(K)-B(I)
      IT(J)=IT(J)+1
 16   CONTINUE
 13   CONTINUE
      REWIND 2
      A=0
      N=0
      DO 17 I=1,mT
      IF(IT(I).EQ.0)GOTO 17
      AMEAN(I)=AMEAN(I)/IT(I)
      A=A+AMEAN(I)
      N=N+1
 17   CONTINUE
      A=A/N
      DO 18 I=1,NS
      READ(2,*)(Z(J),J=1,NT)
      CROSS=0
      C(I)=0
      NCROSS=0
      DO 19 J=1,NLAG
      JLAG=J-ILAG-1
      Q=0
      N=0
      QA=0
      QZ=0
      DO 20 K=1,mT
      L=K+IS(I)+JLAG+nt1-1
c
      if(l.lt.nt1.or.l.gt.nt2)goto 20
c
      R=AMEAN(K)-A
      S=Z(L)-B(I)
      Q=Q+R*S
      QA=QA+R*R
      QZ=QZ+S*S
      N=N+1
 20   CONTINUE
      IF(JLAG.EQ.0)CZERO=Q/sqrt(qa*qz)
      IF(Q/N.LT.CROSS)GOTO 19
      C(I)=Q/SQRT(QA*QZ)
      CROSS=Q/N
      NCROSS=JLAG
 19   CONTINUE
      IF(C(I).LT.TRESH)GOTO 18
      if(abs(c(i)-czero).lt.tresh2)goto 18
      IS(I)=IS(I)+NCROSS
      IF(NCROSS.NE.0)IFLAG=1
 18   CONTINUE
      IF(IFLAG.EQ.0)GOTO 21
 11   CONTINUE
 21   REWIND 2
      write(3,99)
 99   format(3x,'active set')
      DO 22 I=1,mT
      AMEAN(I)=0
 22   IT(I)=0
      DO 23 I=1,NS
      READ(2,*)(Z(J),J=1,NT)
      IF(C(I).LT.TRESH)GOTO 23
      write(3,*)i
      DO 24 J=1,mT
      K=J+IS(I)+nt1-1
      IF(K.LT.nt1.OR.K.GT.NT2)GOTO 24
      AMEAN(J)=AMEAN(J)+Z(K)
      IT(J)=IT(J)+1
 24   CONTINUE
 23   CONTINUE
      DO 25 I=1,mT
      IF(IT(I).EQ.0)GOTO 25
      AMEAN(I)=AMEAN(I)/IT(I)
 25   CONTINUE
      RETURN
      END