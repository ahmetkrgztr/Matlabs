function [errMSE,vars,B] = polyfitt(order,x,y)
    vars=zeros(length(x),order+1);
    for i = 0:order+1
        if i ==0
            vars(:,1)= 1;
        else
            for xs = 1:length(x)
                vars(xs,i)=x(xs,1)^(i-1);
            end
        end
    end
    B=((transpose(vars)*vars)^(-1))*transpose(vars)*y;
    yEst=vars*B;
    errMSE=sum((y-yEst).^2)/sum((y-mean(y)).^2);
    %yacCurv=sum(((x.^3-x+1)-yEst).^2)/sum(((x.^3-x+1)-mean(y)).^2);
end