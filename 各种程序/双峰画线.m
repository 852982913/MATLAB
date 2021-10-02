if (zong1-zong2)>0
    line([heng1 heng1],[zong1 zong1-100]);
    line([heng2 heng2],[zong2 zong2-100+zong1-zong2]);
else
    line([heng1 heng1],[zong1 zong1-100]);
    line([heng2 heng2],[zong2 zong2-100]);
end
