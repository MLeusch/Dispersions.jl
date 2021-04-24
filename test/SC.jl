using Base.Iterators

@testset "2D" begin
    sc_2d_2 = gen_cP_kGrid(2,2,1.0)
    sc_2d_16 = gen_cP_kGrid(16,2,1.0)
    @test Nk(sc_2d_2) == 2
    @test all(isapprox.(flatten(collect(gridPoints(sc_2d_2))), flatten([(0,0) (0,π); (π,0) (π,π)])))
    @test all(expandKGrid(Dispersions.reduceKGrid(sc_2d_2)) .== sc_2d_2)
    @test all(expandKGrid(Dispersions.reduceKGrid(sc_2d_16)) .== sc_2d_16)
end


@testset "3D" begin
    sc_3d_2 = gen_cP_kGrid(2,3)
    sc_3d_16 = gen_cP_kGrid(16,3)
    indTest = reshape([(1, 1, 1) (2, 1, 1) (1, 2, 1) (2, 2, 1) (1, 1, 2) (2, 1, 2) (1, 2, 2) (2, 2, 2)], (2,2,2))
    gridTest = reshape([(0, 0, 0) (π, 0, 0) (0, π, 0) (π, π, 0) (0, 0, π) (π, 0, π) (0, π, π) (π, π, π)], (2,2,2))
    @test Nk(sc_3d_2) == 2
    @test all(isapprox.(flatten(collect(gridPoints(sc_3d_2))), flatten(gridTest)))
    @test all(expandKGrid(Dispersions.reduceKGrid(sc_3d_2)) .== sc_3d_2)
    @test all(expandKGrid(Dispersions.reduceKGrid(sc_3d_16)) .== sc_3d_16)
end
