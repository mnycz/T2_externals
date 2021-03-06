      PROGRAM RC_CONVERT

      IMPLICIT NONE

      real*8 e,ep,theta,corfac,xbnuc,q2,sigborn,sigrad,sigelas
      real*8 sigqe,siginel,t1,t2,t3,t4
      integer i,npts,aa,zz,ll
      character*50 id
      logical thend
      character*150 infile,outfile,test
      character*200 header 
      thend = .false.
    
      call getarg(1,id)
      

c      ll=len(id)
c      charter(len=ll) id2 
      outfile = "OUT/table_"//id
      infile ="OUT/"//id
      aa=12
      zz= 6
      
      open(21,file=infile,status='old')
      
      open(22,file=outfile,status='new')
      
      
      read(21,'(A)') header
      dowhile(.not.thend)
        read(21,*) e,ep,theta,xbnuc,q2,sigborn,siginel,sigqe,
     &            sigrad,sigelas,t1,t2,t3
        corfac = sigborn/sigrad
         
c     if(abs(e-1.2).LT.0.1) then  
        write(22,2100)  aa,zz,e,ep,theta,sigborn,corfac 
c      elseif(abs(e-2.3).LT.0.1) then 
c        write(23,2100) e,ep,theta,sigborn,corfac 
c      elseif(abs(e-3.5).LT.0.1) then 
c        write(24,2100) e,ep,theta,sigborn,corfac 
c      elseif(abs(e-4.6).LT.0.1) then 
c        write(25,2100) e,ep,theta,sigborn,corfac 
c      endif

      enddo

      close(21)
      close(22)
c      close(23)
c      close(24) 
c      close(25)

 2000 thend = .true.
 2100 format(i2,i2,3f8.3,2x,F13.4,2x,F10.5)

      end
