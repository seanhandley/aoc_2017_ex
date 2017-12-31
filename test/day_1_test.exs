defmodule Day1Test do
  use ExUnit.Case
  import Day1

  doctest Day1

  test "day 1 part 1" do
    assert part_1(input()) == 1216
  end

  test "day 1 part 2" do
    assert part_2(input()) == 1072
  end

  def input do
    """
    52288333363558485499154593667379825983129
    59583817455621545976784792489468198365998
    23272273487661233235237619281355294981427
    59475757743395298119766443615177955869983
    19242241614813622734255797569571577699238
    59266728742816639822157288586941641968268
    77597439784345718212671465143383946245256
    48338739929479912368172669885577319718389
    27816876684448794876169743872255685788243
    32243937231312988762526266435172368839991
    15665656935521675772866516185899317132494
    71672361549347639711562768788766519478174
    63773414689959545545182529168592273976938
    85254329628812355612487594445522395853551
    73456749883838224861613796963797136961544
    35999735883263887928939699248553164379523
    13492551671545714262784738343517166544197
    19454717351515592724417544729647428215411
    49511816483178758275258144537588461945488
    72789943372281952995222779173812444186491
    11542647618867225324974447894686331791513
    68321991328689178912435911957193547211291
    16229164688256853628339233919671468781913
    16741562421415279386458533294446842884917
    18768734336215242422894881356753135444982
    45498637424139153782925723745249728743885
    49387779264857667319688994956831723412586
    33691879537886118413883539998755191728963
    29524346527265231767868839696693328273381
    77272678294916611293295435692375748513936
    72986999229849259777249729442779916868232
    19295939734313874834861796179591659174726
    43235753311389621278156665915493941986679
    74883474485517194816325722316324635755915
    99696388223344219228325134233238538854289
    43775633184888724242338754221469115722672
    51796836389674156786976251381776334447651
    26223885478348951332634398291612134852858
    68394246617832992265582222542653435919169
    61776331679628398479858266769554174266171
    26288255366123169174674348417932158291334
    64676763776432322684277152359856242939993
    57897882159583673624676524448541239519721
    18358417629679454978687337137675495295768
    45171963199939861782828767193758499869795
    94258458831457363238182251293118459972149
    87663433375689621746665629187252511643969
    31528331626922283574453243137894513764995
    91584957144729638393972143328152411413277
    14672141875129895
    """
    |> String.replace("\n", "")
  end
end
