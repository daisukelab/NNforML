function ret = q11()
  rbm_w = small_test_rbm_w
  % sum(w * v) * h
  vs = v1024new();
  wvs = vs * rbm_w;
  ret = wvs;
end

function ret = v1024new()
  ret = [];
  for i1 = 0:1
      for i2 = 0:1
          for i3 = 0:1
              for i4 = 0:1
                  for i5 = 0:1
                      for i6 = 0:1
                          for i7 = 0:1
                              for i8 = 0:1
                                  for i9 = 0:1
                                      for i10 = 0:1
                                          ret = [ret; i1 i2 i3 i4 i5 i6 i7 i8 i9 i10];
                                      end
                                  end
                              end
                          end
                      end
                  end
              end
          end
      end
  end
end
