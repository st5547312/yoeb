package.path = GetPackagePath();
local loadArr={"�Զ�����"};
for i=1,#loadArr
do
	package.loaded[loadArr[i]]=nil;
	require(loadArr[i]);
end

--ָ��ְҵ  Ұ���ˡ�Ů�ס����塢�����������ߡ���Ӱ��ʥ����ɮ��
g_newRoleJob="��Ӱ"
--����ְҵ ��ʿ����ͽ�����������͡����ۡ�׷���ߡ������ҡ�Ԫ��ʹ���ٻ�ʦ�������ߡ���ʿ���ھ����й١�ʥ�ڡ��ػ��ߡ���Ӱ��ʦ����թʦ���ƻ��ߡ�����ʹͽ��
g_shengHuaJob="��Ӱ��ʦ"
--����ʹ�õ����� ֧��(��}����}צ}ذ��|����|���ֽ�|ϸ��|���ָ�|���ִ�|����ذ��|����|ս��|��|����|˫�ֽ�|˫�ָ�|˫�ִ�) �����Ҫ�������м���|�ֿ�
SetUseWeapon("ذ��|��")
--�����Լ��õ�װ������ 
SetUseZhuangBeiTypeData("Dex|DexInt|StrDex","�·�")
SetUseZhuangBeiTypeData("Dex|DexInt","ͷ��")
SetUseZhuangBeiTypeData("Str|StrDex|Dex","����")
SetUseZhuangBeiTypeData("Dex|DexInt","Ь��")
SetUseZhuangBeiTypeData("StrInt","����")
SetUseZhuangBeiTypeData("Str|StrDex","��")

g_attackDis=20				--��������
g_duobiHpVal=0.2

--SetNeedSkillLineData(val,str,invalidLv,pos)--���û����ܱ�ʯ���� 
--val=ÿ�鱦ʯ�ı���ֵ
--str="��ʯ1,��ʯ1����|��ʯ2,��ʯ2����|��ʯ3,��ʯ3����" ��������֮����,���� ��ʯ֮����|����
--invalidLv=ʧЧ�ȼ� ��������ȼ��Ͳ�����Ҫ����
--pos=ָ��λ�� nilΪ�Զ�ѡ�� 2Ϊ�·� 3Ϊ������ 4Ϊ������ 5Ϊͷ�� 6Ϊ���� 7Ϊ���ָ 8Ϊ�ҽ�ָ 9Ϊ���� 10ΪЬ�� 11Ϊ����
--nType ��Ч���� nilΪ���ۺ�ʱ����Ч 0Ϊû��ˢ������Ч 1Ϊֻ��ˢ������Ч

SetNeedSkillLineData(10,"���ߴ��,nil",2,nil,nil)
SetNeedSkillLineData(95,"䓽��F��,nil|�܂��rʩ���o��,nil|��ŭ,nil",nil,9,nil)
SetNeedSkillLineData(96,"�����lʿ,nil|����֮�|�o��,nil|���؈D�v�o��,nil",nil,4,nil)
SetNeedSkillLineData(97,"��ʹ֮��,nil|�̿�ӡӛ,nil|���Еrӡӛ�o��,nil",nil,nil,nil)
SetNeedSkillLineData(98,"����֮��,nil|Ԫ�؜Q��,nil|�ن�����ħ��,nil",nil,nil,nil)
SetNeedSkillLineData(99,"��������,nil|Ѹ�ٽM�b�o��,nil|�C���ж��o��,nil",18,nil,nil)
SetNeedSkillLineData(100,"�`�w����,nil|ҹ���o��,nil|̓�ղٿv�o��,nil|�Ͷ�Ͷ�����o��,nil|���ӻ�������o��,nil|�o߅�����o��,nil|�C���ж��o��,nil|���ٹ����o��,nil",nil,nil,nil)

--��ӹ������� name=������ className=�������� noLine=����ֱ�߾��ܹ��� ��ѡ�������ܻ���ϵ���Ѱ�ң�Ҫ�������ļ��ܼ���ǰ��

AddAttackSkillData("�`�w����","Caustic Arrow")
AddAttackSkillData("��������","Explosive Trap")
AddAttackSkillData("���ߴ��","Viper Strike")
AddAttackSkillData("��ͨ����","melee")

--SetSkillLimitMaxLv(name,className,maxLv)--���ü��ܱ�ʯ���ȼ� name=���ܱ�ʯ��Ʒ�� className=���ܱ�ʯ��Ʒ���� maxLv=���Ƶ����ȼ�
SetSkillLimitMaxLv("�܂��rʩ���o��",nil,1)
SetSkillLimitMaxLv("��ŭ",nil,1)


-- SetYiJieZhaoHuanLingTiData(mapClassName,name,className)--�������ʱ�ٻ����������� mapClassName=����ͼ���� name=������ className=��������

SetNeedFlaskData(1,"����ҩ��","nil")
SetNeedFlaskData(2,"����ҩ��","nil")
SetNeedFlaskData(3,"ˮ��ҩ��","nil")
SetNeedFlaskData(4,"ħ��ҩ��","nil")
SetNeedFlaskData(5,"ħ��ҩ��","nil")


g_addHpVal=0.7--HP���ڶ��ٳԺ�ҩ
g_addMpVal=0.2--MP���ڶ��ٳ���ҩ

---------------------------------------��װ����
--SetAtuoChangeEquipData(job,pos,name,val,yijie) ���㷽ʽ���� �����������ֵ���Ա���ֵ  ����װ���߾ͻ�������
--job ְҵ ֧��(��Ӱ|Ұ����|������|Ů��|����|ʥ����ɮ) ���������м���|����
--pos ��λ ֧��(��ָ|����|����|Ь��|����|�·�|ͷ��|��|����|צ}ذ��|����|���ֽ�|ϸ��|���ָ�|���ִ�|����ذ��|����|ս��|��|����|˫�ֽ�|˫�ָ�|˫�ִ�) ���������м���|����
--name ������ ֧����Ϸ�ڵ�װ�������� �����������Զ�����(�����˺������ס����ܡ����ܡ��������ܶ�)
--val ����ֵ ֧��С��
--nType ��װ���� 0��nil����Ϊһֱ��Ч 1Ϊ��ͼʱ����Ч 2Ϊ���ʱ����Ч
SetAtuoChangeEquipData("��Ӱ|Ұ����|������|Ů��|����|ʥ����ɮ","��ָ|����|����|Ь��|����|�·�|ͷ��|����","fire_and_cold_damage_resistance_%",0.25)--�������˪�˺����� %
SetAtuoChangeEquipData("��Ӱ|Ұ����|������|Ů��|����|ʥ����ɮ","��ָ|����|����|Ь��|����|�·�|ͷ��|����","fire_and_lightning_damage_resistance_%",0.25)--�����������˺����� %
SetAtuoChangeEquipData("��Ӱ|Ұ����|������|Ů��|����|ʥ����ɮ","��ָ|����|����|Ь��|����|�·�|ͷ��|����","cold_and_lightning_damage_resistance_%",0.2)--��˪�������˺����� %
SetAtuoChangeEquipData("��Ӱ|Ұ����|������|Ů��|����|ʥ����ɮ","��ָ|����|����|Ь��|����|�·�|ͷ��|����","base_resist_all_elements_%",0.35)--ȫԪ�ؿ��� %
SetAtuoChangeEquipData("��Ӱ|Ұ����|������|Ů��|����|ʥ����ɮ","��ָ|����|����|Ь��|����|�·�|ͷ��|����","base_fire_damage_resistance_%",0.3)--���������˺����� %
SetAtuoChangeEquipData("��Ӱ|Ұ����|������|Ů��|����|ʥ����ɮ","��ָ|����|����|Ь��|����|�·�|ͷ��|����","base_cold_damage_resistance_%",0.3)--������˪�˺����� %
SetAtuoChangeEquipData("��Ӱ|Ұ����|������|Ů��|����|ʥ����ɮ","��ָ|����|����|Ь��|����|�·�|ͷ��|����","base_lightning_damage_resistance_%",0.3)--���������˺����� %
SetAtuoChangeEquipData("��Ӱ|Ұ����|������|Ů��|����|ʥ����ɮ","��ָ|����|����|Ь��|����|�·�|ͷ��|����","cold_damage_resistance_%",0.3)--��˪���� %
SetAtuoChangeEquipData("��Ӱ|Ұ����|������|Ů��|����|ʥ����ɮ","��ָ|����|����|Ь��|����|�·�|ͷ��|����","fire_damage_resistance_%",0.3)--���濹�� %
SetAtuoChangeEquipData("��Ӱ|Ұ����|������|Ů��|����|ʥ����ɮ","��ָ|����|����|Ь��|����|�·�|ͷ��|����","lightning_damage_resistance_%",0.3)--���翹�� %
SetAtuoChangeEquipData("��Ӱ|Ұ����|������|Ů��|����|ʥ����ɮ","��ָ|����|����|Ь��|����|�·�|ͷ��|����","base_movement_velocity_+%",0.3)--�����ƶ��ٶ� +%
SetAtuoChangeEquipData("��Ӱ|Ұ����|������|Ů��|����|ʥ����ɮ","��ָ|����|����|Ь��|����|�·�|ͷ��|����","base_maximum_life",0.3)--����
SetAtuoChangeEquipData("��Ӱ|Ұ����|������|Ů��|����|ʥ����ɮ","��ָ|����|����|Ь��|����|�·�|ͷ��|����","movement_velocity_+%",0.3)--�ƶ��ٶ� +%

SetAtuoChangeEquipData("��Ӱ","����","additional_strength",0.2)--
SetAtuoChangeEquipData("��Ӱ","����","additional_intelligence",0.2)--
SetAtuoChangeEquipData("��Ӱ","����","additional_strength_and_intelligence",0.3)--

--��Ӱ
SetAtuoChangeEquipData("��Ӱ","ذ��","�����˺�",5,nil)
SetAtuoChangeEquipData("��Ӱ","ذ��","Local_Maximum_Added_Fire_Damage",5,nil)
SetAtuoChangeEquipData("��Ӱ","ذ��","Local_Maximum_Added_cold_Damage",5,nil)
SetAtuoChangeEquipData("��Ӱ","ذ��","Local_Maximum_Added_lightning_Damage",5,nil)
SetAtuoChangeEquipData("��Ӱ","ذ��","Local_critical_strike_chance_%",3,nil)
SetAtuoChangeEquipData("��Ӱ","��","����",1,nil)

--��Ӱ--��ɫ
SetZhengTiColorVarData(2,0,4,2,nil,650,true)
SetZhengTiColorVarData(2,0,5,1,nil,600,true)
SetZhengTiColorVarData(2,0,4,1,nil,550,true)
SetZhengTiColorVarData(2,0,5,0,nil,500,true)
SetZhengTiColorVarData(2,0,4,0,nil,450,true)
SetZhengTiColorVarData(2,0,3,1,nil,400,true)
SetZhengTiColorVarData(2,0,3,0,nil,300,true)
SetZhengTiColorVarData(2,0,2,0,nil,200,true)
SetZhengTiColorVarData(2,0,1,0,nil,100)
SetZhengTiColorVarData(2,1,0,0,nil,60)
SetZhengTiColorVarData(2,0,0,1,nil,50)

SetZhengTiColorVarData(3,0,3,0,nil,30,true)
SetZhengTiColorVarData(3,0,2,0,nil,20,true)
SetZhengTiColorVarData(3,0,1,0,nil,10)

SetZhengTiColorVarData(4,2,1,0,nil,300,true)
SetZhengTiColorVarData(4,1,1,0,nil,200,true)
SetZhengTiColorVarData(4,1,0,0,nil,100)

SetZhengTiColorVarData(5,0,3,1,nil,450,true)
SetZhengTiColorVarData(5,0,2,2,nil,400,true)
SetZhengTiColorVarData(5,0,2,1,nil,300,true)
SetZhengTiColorVarData(5,0,1,1,nil,200,true)
SetZhengTiColorVarData(5,0,1,0,nil,100)

SetZhengTiColorVarData(9,3,1,0,nil,400,true)
SetZhengTiColorVarData(9,2,2,0,nil,350,true)
SetZhengTiColorVarData(9,2,1,0,nil,300,true)
SetZhengTiColorVarData(9,2,0,0,nil,200,true)
SetZhengTiColorVarData(9,1,0,0,nil,100)

SetZhengTiColorVarData(10,0,3,1,nil,450,true)
SetZhengTiColorVarData(10,0,2,2,nil,400,true)
SetZhengTiColorVarData(10,0,2,1,nil,300,true)
SetZhengTiColorVarData(10,0,1,1,nil,200,true)
SetZhengTiColorVarData(10,0,1,0,nil,100)



AddShengJiZhuangBeiGoodsData("���ʯ","Metadata/Items/Currency/CurrencyUpgradeToRare",0,30,0)--������Ч ����30�����õ����ɫװ��
AddShengJiZhuangBeiGoodsData("����ʯ","Metadata/Items/Currency/CurrencyUpgradeMagicToRare",1,50,0)--������Ч ����50�����ø�������ɫװ��

--������+ϡ���� ���ʱ����Ч
--SetAtuoChangeEquipData("��Ӱ|Ұ����|������|Ů��|����|ʥ����ɮ","��ָ|����|����|Ь��|����|�·�|ͷ��|����|��","base_item_found_rarity_+%",0.5,2)--���A��Ʒ����Ʒ�| +%
--SetAtuoChangeEquipData("��Ӱ|Ұ����|������|Ů��|����|ʥ����ɮ","��ָ|����|����|Ь��|����|�·�|ͷ��|����|��","base_item_found_quantity_+%",1.5,2)--��Ʒ���䔵������ %

--�߼���װ����
SetGaoJiHuanZhuangData("����","����֮��","Metadata/Items/Armours/BodyArmours/BodyInt1","�޾�֮��","Tabula Rasa")

--SetTaskShengJiData(taskClassName,taskIndex,shengjiMapClassName,needLv)--������ͼʱ���� taskClassName=�������� taskIndex=�������� nilΪ���ԣ�ֻƥ���������� shengjiMapClassName=Ҫˢ�ĵ�ͼ���� needLv=���������ټ�Ϊֹ
SetTaskShengJiData("a5q7",nil,"1_5_5",50,true)--�� �������������� ��ʱ��ˢ����ʥ�ص�50���ٽ�����һ����
SetTaskShengJiData("a9q3",nil,"2_9_1",68,true)--�� ���L���w�� ��ʱ��ˢ�BѪˮ����68���ٽ�����һ����

SetTaskMiGongData("a8q7",nil,1)--���ڵ���a9q1�� ���Թ�1
SetTaskMiGongData("a10q1",nil,2)--���ڵ���a10q1 ���Թ�2
SetTaskMiGongDataByLv(80,3)--���ڵ���80�� ���Թ�3


SetChangeLimitCnt("����|�·�|ͷ��|����|Ь��",2)
SetChangeLimitCnt("����",3)
SetChangeLimitCnt("����|��ָ",4)


--SetNeedAddTianFu(tfStr)--�����츳�ӵ� 
SetNeedAddTianFu("��Ӱ=physical_damage_life1617-����ͻ�������c����|physical_damage1618-����ͻ������|physical_damage1621-����ͻ������|physical_damage1620-����ͻ������|physical_damage1619-����ͻ������|agility965-���C֮�w|degeneration_damage1569-���m����|degeneration_damage_notable1575-�y��|one_hand_damage2102-������������|repartee1051-��|degeneration_damage1570-���m����|acceleration1238-����֮��|dexterity981-����|strength815-����|dagger_poison2528-ذ�׵Į�����B����|dagger_poison2530-ذ�׵Į�����B�������ж��C��|adder's_touch443-����֮�||mastery_dagger79-ذ�׌���-44869|dexterity848-����|critical_ailment_dot_multiplier2666-����������B���m�����ӳ�|critical_chance2265-������|critical_dot_mult_notable2664-���K��ĥ|dexterity855-����|dexterity856-����|might770-�oη|intelligence957-�ǻ�|aura_area_of_effect1203-��hЧ������|reduced_mana_reservation1199-����Ч��|aura_effect_reservation_cost_notable1558-����|dexterity995-����|perfect_aim591-�����W|mana1479-ħ����ˎ��Ч��|mana1478-ԭʼ����|stun_recovery544-�����ͱ��╞ѣ|avoid_stun553-��ľ֮��|stun_recovery543-�����ͱ��╞ѣ|finesse993-����|dexterity984-����|dexterity985-����|dexterity874-����|poison_damage2183-�ж������ӳ�|poison_chance2184-�ж������ӳ�|poison_notable2185-����֮��|mastery_poison201-�ж�����-62897|dexterity839-����|sword_damage_accuracy2499-���g���ֺ�����ˎ���֏�|sword_damage_accuracy2498-���g���ֺ�����ˎ���֏�|sword_damage_accuracy2497-���g���ֺ�����ˎ���֏�|sword_damage_accuracy_notable2500_-���ϑ�|mastery_sword228-���g���֌���-42014|life1120-�����ͱ���Ԫ�خ�����B|thick_skin1157-����֮�w|life1156-�����ͱ���Ԫ�خ�����B|life1167-�����ͱ���Ԫ�خ�����B|mastery_life133-��������-47642|dexterity870-����|claws_of_the_pride489-ֱ�X|life1412-����|alchemist532-ˎ�݌W|mastery_life146-��������-64381|life1216-����|life703-����|fitness617-ѪҺ��ȡ|life1220-����|mental_acuity1046-ԎӋ|dexterity865-����|damage_ailment_critical_keystone_2182-�^�����y|dexterity860-����|dagger_damage2060-ذ�ׂ������Ƅ��ٶ�|dagger_mobility2533-ذ�׵Ă������Ƅ��ٶ�|from_the_shadows471-Ӱ��|poison_damage2126-�ж��C��|degen_damage2129-�ж��C�ʺͳ��m�r�g|poison_notable2128-����֮��|mastery_poison199-�ж�����-64264|dexterity867-����|damage_area_projectile_speed_2296-���Еr�@��������ħ��|intelligence927-�ǻ�|intelligence926-�ǻ�|dagger_damage264-ذ�ׂ���|dagger_damage_and_attack_speed466-ذ�ׂ����͹����ٶ�|dagger_damage_and_attack_speed467-ذ�ׂ����͹����ٶ�|dagger_damage_and_attack_speed468-ذ�ׂ����͹����ٶ�|flaying266-��Ƥ��|dagger_damage_and_critical_strike_chance465-ذ�ױ����ʺͱ����ӳ�|dagger_damage_and_critical_strike_multiplier262-ذ�ױ����ʺͼӳ�|dagger_damage_and_critical_strike_multiplier263-ذ�ױ����ʺͼӳ�|dagger_global_crit_notable2527-����|life1415-����|life_life_leech1629-��Ѫ��|ghost_dance_keystone2852_-����|intelligence964-�ǻ�|strength702-����|intelligence887-�ǻ�|life_es1768-�����c�����o��|life_es1767-�����c�����o��|life_es1766-�����c�����o��|life_es_notable1769-�ں�|")
SetNeedAddTianFu("��Ӱ����=AscendancyAssassin13-�����ʡ��`��Ч��|AscendancyAssassin14-�F����|AscendancyAssassin1-�����ʡ���������m�r�g|AscendancyAssassin2-����������|") 
