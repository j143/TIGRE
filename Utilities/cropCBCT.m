function img=cropCBCT(img,geo)
%cropCBCT(img,geo) will crop the parts of the iamge that will not have
% clear information anfter the recosntruction. It sets to zero everything
% outside the cylinder constrained in the image, and crops a small cone
% shape on top and bottom of the image.

% Tangent is equal, cropRadious:
cropR=(geo.sDetector(1)/2*geo.DSO)/geo.DSD;
%maximum distance from O
maxD=min(geo.nVoxel)/2;

% Crop radious will be theminimum of them
cropR=min([cropR/geo.dVoxel(1) maxD]);
[x,y]=meshgrid(1:size(img,1),1:size(img,2));
inM=(x-size(img,1)/2).^2+(y-size(img,2)/2).^2<cropR^2;
%crop
img=bsxfun(@times,img,inM);

% Cone on top and bottom
cropH=(geo.sDetector(2)/2*geo.DSO)/geo.DSD;
maxZ=geo.sVoxel(3)/2;
cropH=maxZ-cropH;
cropH2=cropH*(geo.DSO-geo.sVoxel(1)/2)/geo.DSO;




end