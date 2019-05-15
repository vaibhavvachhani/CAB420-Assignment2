X = load('data/faces.txt'); % load face dataset
img = reshape(X(1,:),[24 24]); % convert vectorized datum to 24x24 image patch
imagesc(img); axis square; colormap gray; % display an image patch

X_nonzero = (X - mean(X));
%a.)
[U,S,V] = svd(X_nonzero);
X_0 = (U*S)*V';
W = U*S;
%b.)
figure(1)
for i=1:10
    X_dash = W (:,1:i) *V(:,1:i)';
    mean_squared_error = mean(mean( (X_0- X_dash).^2));
    plot(i, mean_squared_error,'rx')
    hold on;
end
    
hold off;

%c.)
for j=1:5
    alpha = 2*median(abs(W(:,j)));
    dir1 = mean(X) + alpha*(V(:,j))';
    dir2 = mean(X) - alpha*(V(:,j))';
    img2 = reshape(dir1,[24 24]);
    img3 = reshape(dir2,[24 24]);
    imagesc(img2); axis square; colormap gray;
    imagesc(img3); axis square; colormap gray;
end

%d.)
idx = 15;  % pick some data at random or otherwise
figure; hold on; axis ij; colormap(gray);
range = max(W(idx,1:2)) - min(W(idx,1:2)); % find range of coordinates to be plotted
scale = [200 200]./range; % want 24x24 to be visible
for i=idx
    imagesc(W(i,1)*scale(1),W(i,2)*scale(2),reshape(X(i,:),24,24))
end


%e.)
for j=1:50
    alpha = 2*median(abs(W(:,j)));
    dir1 = mean(X) + alpha*(V(:,j))';
    dir2 = mean(X) - alpha*(V(:,j))';
    img2 = reshape(dir1,[24 24]);
    img3 = reshape(dir2,[24 24]);
    imagesc(img2); axis square; colormap gray;
    imagesc(img3); axis square; colormap gray;
end




