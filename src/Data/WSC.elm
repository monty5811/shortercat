module Data.WSC exposing (Question, data)


type alias Question =
    { question : String
    , answer : String
    }


data : List ( Int, Question )
data =
    [ ( 1
      , { question = """What is the chief end of man?"""
        , answer = """Man's chief end is to glorify God, and to enjoy Him for ever."""
        }
      )
    , ( 2
      , { question = """What rule hath God given to direct us how we may glorify and enjoy Him?"""
        , answer = """The Word of God, which is contained in the Scriptures of the Old and New Testaments, is the only rule to direct us how we may glorify and enjoy Him."""
        }
      )
    , ( 3
      , { question = """What do the Scriptures principally teach?"""
        , answer = """The Scriptures principally teach what man is to believe concerning God, and what duty God requires of man."""
        }
      )
    , ( 4
      , { question = """What is God?"""
        , answer = """God is a Spirit, infinite, eternal, and unchangeable, in his being, wisdom, power, holiness, justice, goodness, and truth."""
        }
      )
    , ( 5
      , { question = """Are there more Gods than one?"""
        , answer = """There is but one only, the living and true God."""
        }
      )
    , ( 6
      , { question = """How many persons are there in the Godhead?"""
        , answer = """There are three persons in the Godhead; the Father, the Son, and the Holy Ghost; and these three are one God, the same in substance, equal in power and glory."""
        }
      )
    , ( 7
      , { question = """What are the decrees of God?"""
        , answer = """The decrees of God are, his eternal purpose, according to the counsel of his will, hereby, for his own glory, he hath fore-ordained whatsoever comes to pass."""
        }
      )
    , ( 8
      , { question = """How doth God execute his decrees?"""
        , answer = """God executeth his decrees in the works of creation and providence."""
        }
      )
    , ( 9
      , { question = """What is the work of creation?"""
        , answer = """The work of creation is, God's making all things of nothing, by the word of his power, in the space of six days, and all very good."""
        }
      )
    , ( 10
      , { question = """How did God create man?"""
        , answer = """God created man male and female, after his own image, in knowledge, righteousness, and holiness, with dominion over the creatures."""
        }
      )
    , ( 11
      , { question = """What are God's works of providence?"""
        , answer = """God's works of providence are, his most holy, wise, and powerful preserving and governing all his creatures, and all their actions."""
        }
      )
    , ( 12
      , { question = """What special act of providence did God exercise toward man in the estate wherein he was created?"""
        , answer = """When God had created man, he entered into a covenant of life with him, upon condition of perfect obedience; forbidding him to eat of the tree of the knowledge of good and evil, upon the pain of death."""
        }
      )
    , ( 13
      , { question = """Did our first parents continue in the estate wherein they were created?"""
        , answer = """Our first parents, being left to the freedom of their own will, fell from the estate wherein they were created, by sinning against God."""
        }
      )
    , ( 14
      , { question = """What is sin?"""
        , answer = """Sin is any want of conformity unto, or transgression of, the law of God."""
        }
      )
    , ( 15
      , { question = """What was the sin whereby our first parents fell from the estate wherein they were created?"""
        , answer = """The sin whereby our first parents fell from the estate wherein they were created, was their eating the forbidden fruit."""
        }
      )
    , ( 16
      , { question = """Did all mankind fall in Adam's first transgression?"""
        , answer = """The covenant being made with Adam, not only for himself, but for his posterity; all mankind, descending from him by ordinary generation, sinned in him, and fell with him, in his first transgression."""
        }
      )
    , ( 17
      , { question = """Into what estate did the fall bring mankind?"""
        , answer = """The fall brought mankind into an estate of sin and misery."""
        }
      )
    , ( 18
      , { question = """Wherein consists the sinfulness of that estate whereinto man fell?"""
        , answer = """The sinfulness of that estate whereinto man fell, consists in the guilt of Adam's first sin, the want of original righteousness, and the corruption of his whole nature, which is commonly called Original Sin; together with all actual transgressions which proceed from it."""
        }
      )
    , ( 19
      , { question = """What is the misery of that estate whereinto man fell?"""
        , answer = """All mankind by their fall lost communion with God, are under his wrath and curse, and so made liable to all miseries in this life, to death itself, and to the pains of hell for ever."""
        }
      )
    , ( 20
      , { question = """Did God leave all mankind to perish in the estate of sin and misery?"""
        , answer = """God having, out of his mere good pleasure, from all eternity, elected some to everlasting life, did enter into a covenant of grace, to deliver them out of the estate of sin and misery, and to bring them into an estate of salvation by a Redeemer."""
        }
      )
    , ( 21
      , { question = """Who is the Redeemer of God's elect?"""
        , answer = """The only Redeemer of God's elect is the Lord Jesus Christ, who, being the eternal Son of God, became man, and so was, and continueth to be, God and man in two distinct natures, and one person, for ever."""
        }
      )
    , ( 22
      , { question = """How did Christ, being the Son of God, become man?"""
        , answer = """Christ, the Son of God, became man, by taking to himself a true body, and a reasonable soul, being conceived by the power of the Holy Ghost, in the womb of the Virgin Mary, and born of her yet without sin."""
        }
      )
    , ( 23
      , { question = """What offices doth Christ execute as our Redeemer?"""
        , answer = """Christ, as our Redeemer, executeth the offices of a prophet, of a priest, and of a king, both in his estate of humiliation and exaltation."""
        }
      )
    , ( 24
      , { question = """How doth Christ execute the office of a prophet?"""
        , answer = """Christ executeth the office of a prophet, in revealing to us, by his word and Spirit, the will of God for our salvation."""
        }
      )
    , ( 25
      , { question = """How doth Christ execute the office of a priest?"""
        , answer = """Christ executeth the office of a priest, in his once offering up of himself a sacrifice to satisfy divine justice, and reconcile us to God, and in making continual intercession for us."""
        }
      )
    , ( 26
      , { question = """How doth Christ execute the office of a king?"""
        , answer = """Christ executeth the office of a king, in subduing us to himself, in ruling and defending us, and in restraining and conquering all his and our enemies."""
        }
      )
    , ( 27
      , { question = """Wherein did Christ's humiliation consist?"""
        , answer = """Christ's humiliation consisted in his being born, and that in a low condition, made under the law, undergoing the miseries of this life, the wrath of God, and the cursed death of the cross; in being buried, and continuing under the power of death for a time."""
        }
      )
    , ( 28
      , { question = """Wherein consisteth Christ's exaltation?"""
        , answer = """Christ's exaltation consisteth in his rising again from the dead on the third day, in ascending up into heaven, in sitting at the right hand of God the Father, and in coming to judge the world at the last day."""
        }
      )
    , ( 29
      , { question = """How are we made partakers of the redemption purchased by Christ?"""
        , answer = """We are made partakers of the redemption purchased by Christ, by the effectual application of it to us by his Holy Spirit."""
        }
      )
    , ( 30
      , { question = """How doth the Spirit apply to us the redemption purchased by Christ?"""
        , answer = """The Spirit applieth to us the redemption purchased by Christ, by working faith in us, and thereby uniting us to Christ in our effectual calling."""
        }
      )
    , ( 31
      , { question = """What is effectual calling?"""
        , answer = """Effectual calling is the work of God's Spirit, whereby convincing us of our sin and misery, enlightening our minds in the knowledge of Christ, and renewing our wills, he doth persuade and enable us to embrace Jesus Christ, freely offered to us in the gospel."""
        }
      )
    , ( 32
      , { question = """What benefits do they that are effectually called partake of in this life?"""
        , answer = """They that are effectually called do in this life partake of justification, adoption, and sanctification, and the several benefits which, in this life, do either accompany or flow from them."""
        }
      )
    , ( 33
      , { question = """What is justification?"""
        , answer = """Justification is an act of God's free grace, wherein He pardoneth all our sins, and accepteth us as righteous in His sight, only for the righteousness of Christ imputed to us, and received by faith alone."""
        }
      )
    , ( 34
      , { question = """What is adoption?"""
        , answer = """Adoption is an act of God's free grace, whereby we are received into the number, and have a right to all the privileges of the Sons of God."""
        }
      )
    , ( 35
      , { question = """What is sanctification?"""
        , answer = """Sanctification is the work of God's free grace, whereby we are renewed in the whole man after the image of God, and are enabled more and more to die unto sin, and live unto righteousness."""
        }
      )
    , ( 36
      , { question = """What are the benefits which in this life do accompany or flow from justification, adoption, and sanctification?"""
        , answer = """The benefits which in this life do accompany or flow from justification, adoption, and sanctification, are, assurance of God's love, peace of conscience, joy in the Holy Ghost, increase of grace, and perseverance therein to the end."""
        }
      )
    , ( 37
      , { question = """What benefits do believers receive from Christ at death?"""
        , answer = """The souls of believers are at their death made perfect in holiness, and do immediately pass into glory; and their bodies, being still united to Christ, do rest in their graves till the resurrection."""
        }
      )
    , ( 38
      , { question = """What benefits do believers receive from Christ at the resurrection?"""
        , answer = """At the resurrection, believers being raised up in glory, shall be openly acknowledged and acquitted in the day of judgement, and made perfectly blessed in the full enjoying of God to all eternity."""
        }
      )
    , ( 39
      , { question = """What is the duty which God requireth of man?"""
        , answer = """The duty which God requireth of man is obedience to His revealed will."""
        }
      )
    , ( 40
      , { question = """What did God at first reveal to man for the rule of his obedience?"""
        , answer = """The rule which God at first revealed to man for his obedience, was the Moral Law."""
        }
      )
    , ( 41
      , { question = """Where is the Moral Law summarily comprehended?"""
        , answer = """The Moral Law is summarily comprehended in the Ten Commandments."""
        }
      )
    , ( 42
      , { question = """What is the sum of the Ten Commandments?"""
        , answer = """The sum of the Ten Commandments is, "to love the Lord our God" with all our heart, all our soul, with all our strength, and with all our mind; and our neighbor as ourselves."""
        }
      )
    , ( 43
      , { question = """What is the preface to the Ten Commandments?"""
        , answer = """The preface to the Ten Commandments is in these words, "I am the Lord your God, who brought you out of the land of Egypt, out of the house OF SLAVERY.\""""
        }
      )
    , ( 44
      , { question = """What doth the preface to the Ten Commandments teach us?"""
        , answer = """The preface to the Ten Commandments teacheth us, That because God is The Lord, and our God, and Redeemer, therefore we are bound to keep all His commandments."""
        }
      )
    , ( 45
      , { question = """Which is the First Commandment?"""
        , answer = """The First Commandment is, "thou shalt have no other gods before Me.\""""
        }
      )
    , ( 46
      , { question = """What is required in the First Commandment?"""
        , answer = """The First Commandment requireth us to know and acknowledge God to be only true God, and our God; and to worship and glorify Him accordingly."""
        }
      )
    , ( 47
      , { question = """What is forbidden in the First Commandment?"""
        , answer = """The First Commandment forbiddeth the denying, or not worshipping and glorifying the true God, as God, [and our God,] and the giving of that worship and glory to any other which is due to Him alone."""
        }
      )
    , ( 48
      , { question = """What are we specially taught by these words, "before me" in the First Commandment?"""
        , answer = """These words "before me" in the First Commandment, teach us, That God who seeth all things, taketh notice of, and is much displeased with, the sin of having any other God."""
        }
      )
    , ( 49
      , { question = """Which is the Second Commandment?"""
        , answer = """The Second Commandment is, "thou shalt not make unto thee any graven image, or any likeness of any thing that is in heaven above, or that is in the earth beneath, or that is in the water under the earth, thou shalt not bow down thyself to them, nor serve them: for I the Lord thy God am a jealous God, visiting the iniquity of the fathers upon the children, unto the third and fourth generation of them that hate Me; and showing mercy unto thousands of them that love Me, and keep my commandments.\""""
        }
      )
    , ( 50
      , { question = """What is required in the Second Commandment?"""
        , answer = """The Second Commandment requireth the receiving, observing, and keeping pure and entire, all such religious worship and ordinances as God hath appointed in His Word."""
        }
      )
    , ( 51
      , { question = """What is forbidden in the Second Commandment?"""
        , answer = """The Second Commandment forbiddeth the worshipping of God by images, or any other way not appointed in His Word."""
        }
      )
    , ( 52
      , { question = """What are the reasons annexed to the Second Commandment?"""
        , answer = """The reasoned annexed to the Second Commandment are, God's sovereignty over us, and the zeal He hath to His own worship."""
        }
      )
    , ( 53
      , { question = """Which is the Third Commandment?"""
        , answer = """The Third Commandment is, "thou shalt not take the name of the Lord thy God in vain: for the Lord will not hold him guiltless that taketh His name in vain.\""""
        }
      )
    , ( 54
      , { question = """What is required in the Third Commandment?"""
        , answer = """The Third Commandment requireth the holy and reverent use of God's names, titles, attributes, ordinances, Word, and works."""
        }
      )
    , ( 55
      , { question = """What is forbidden in the Third Commandment?"""
        , answer = """The Third Commandment forbiddeth all profaning or abusing [of] anything whereby God maketh Himself known."""
        }
      )
    , ( 56
      , { question = """What is the reason annexed to the Third Commandment?"""
        , answer = """The reason annexed to the Third Commandment is, That however the breakers of this commandment may escape punishment from men, yet the Lord our God will not suffer them to escape His righteous judgement."""
        }
      )
    , ( 57
      , { question = """Which is the Fourth Commandment?"""
        , answer = """The Fourth Commandment is, "Remember the Sabbath-day, to keep it holy. Six days shalt thou labour, and do all thy work: But the seventh day is the sabbath of the LORD thy God: in it thou shalt not do any work, thou, nor thy son, nor thy daughter, thy manservant, nor thy maid-servant, nor thy cattle, nor thy stranger that is within thy gates: For in six days the LORD made heaven and earth, the sea, and all that in them is, and rested the seventh day: wherefore the LORD blessed the sabbath day, and hallowed it.\""""
        }
      )
    , ( 58
      , { question = """What is required in the Fourth Commandment?"""
        , answer = """The Fourth Commandment requireth the keeping holy to God such set times as He appointed in His Word; expressly one whole day in seven to be a holy Sabbath to Himself."""
        }
      )
    , ( 59
      , { question = """Which day of the seven hath God appointed to be the weekly Sabbath?"""
        , answer = """From the beginning of the world to the resurrection of Christ, God appointed the seventh day of the week to be the weekly Sabbath; and the first day of the week ever since, to continue to the end of the world, which is the Christian Sabbath."""
        }
      )
    , ( 60
      , { question = """How is the Sabbath to be sanctified?"""
        , answer = """The Sabbath is to be sanctified by a holy resting all that day, even from such worldly employments and recreations as are lawful on other days; and spending the whole time in the public and private exercises of God's worship, except so much as is to be taken up in the works of necessity and mercy."""
        }
      )
    , ( 61
      , { question = """What is forbidden in the Fourth Commandment?"""
        , answer = """The Fourth Commandment forbiddeth the omission or careless performance of the duties required, and the profaning the day by idleness, or doing that which is in itself sinful, or by unnecessary thoughts, words, or works, about our worldly employments or recreations."""
        }
      )
    , ( 62
      , { question = """What are the reasons annexed to the Fourth Commandment?"""
        , answer = """The reasons annexed to the Fourth Commandment are, God's allowing us six days of the week for our own employments, His challenging a special propriety in the seventh, His own example, and His blessing the Sabbath-day."""
        }
      )
    , ( 63
      , { question = """Which is the Fifth Commandment?"""
        , answer = """The Fifth Commandment is, "honour thy father and thy mother, that thy days may be long upon the land which the Lord thy God giveth thee.\""""
        }
      )
    , ( 64
      , { question = """What is required in the Fifth Commandment?"""
        , answer = """The Fifth Commandment requireth the preserving the honour, and performing the duties, belonging to every one in their several places and relations, as superiors, inferiors, or equals."""
        }
      )
    , ( 65
      , { question = """What is the forbidden in the Fifth Commandment?"""
        , answer = """The Fifth Commandment forbiddeth the neglecting of, or doing anything against, the honour and duty which belongeth to every one in their several places and relations."""
        }
      )
    , ( 66
      , { question = """What is the reason annexed to the Fifth Commandment?"""
        , answer = """The reason annexed to the Fifth Commandment is a promise of long life and prosperity (as far as it shall serve for God's glory and their own good) to all such as keep this commandment."""
        }
      )
    , ( 67
      , { question = """Which is the Sixth Commandment?"""
        , answer = """The Sixth Commandment is, "thou shalt not kill.\""""
        }
      )
    , ( 68
      , { question = """What is required in the Sixth Commandment?"""
        , answer = """The Sixth Commandment requireth all lawful endeavours to preserve our own life, and the life of others."""
        }
      )
    , ( 69
      , { question = """What is forbidden in the Sixth Commandment?"""
        , answer = """The Sixth Commandment forbiddeth the taking away of our own life, or the life of our neighbour unjustly, or whatsoever tendeth thereunto."""
        }
      )
    , ( 70
      , { question = """Which is the Seventh Commandment?"""
        , answer = """The Seventh Commandment is, "thou shalt not commit adultery.\""""
        }
      )
    , ( 71
      , { question = """What is required in the Seventh Commandment?"""
        , answer = """The Seventh Commandment requireth the preservation of our own and our neighbor's chasity, in heart, speech, and behaviour."""
        }
      )
    , ( 72
      , { question = """What is forbidden in the Seventh Commandment?"""
        , answer = """The Seventh Commandment forbiddeth all unchaste thoughts, words, and actions."""
        }
      )
    , ( 73
      , { question = """Which is the Eighth Commandment?"""
        , answer = """The Eighth Commandment is, "thou shalt not steal.\""""
        }
      )
    , ( 74
      , { question = """What is required in the Eighth Commandment?"""
        , answer = """The Eighth Commandment requireth the lawful procuring and furthering the wealth and outward estate of ourselves and others."""
        }
      )
    , ( 75
      , { question = """What is forbidden in the Eighth Commandment?"""
        , answer = """The Eighth Commandment forbiddeth whatsoever doth or may unjustly hinder our own or our neighbour's wealth or outward estate."""
        }
      )
    , ( 76
      , { question = """What is the Ninth Commandment?"""
        , answer = """The Ninth Commandment is, "thou shalt not bear false witness against thy neighbour.\""""
        }
      )
    , ( 77
      , { question = """What is required in the Ninth Commandment?"""
        , answer = """The Ninth Commandment requireth the maintaining and promoting of truth between man and man, and of our own and our neighbour's good name, especially in witness-bearing."""
        }
      )
    , ( 78
      , { question = """What is forbidden in the Ninth Commandment?"""
        , answer = """The Ninth Commandment forbiddeth whatsoever is prejudical to truth, or injurious to our own or our neighbour's good name."""
        }
      )
    , ( 79
      , { question = """Which is the Tenth Commandment?"""
        , answer = """The Tenth Commandment is, "thou shalt not covet thy neighbour's house, thou shalt not covet thy neighbour's wife, nor his manservant, nor his maidservant, nor his ox, nor his ass, nor any thing that is thy neighbour's.\""""
        }
      )
    , ( 80
      , { question = """What is required in the Tenth Commandment?"""
        , answer = """The Tenth Commandment requireth full contentment with our own condition, with a right and charitable frame of spirit toward our neighbour, and all this is his."""
        }
      )
    , ( 81
      , { question = """What is forbidden in the Tenth Commandment?"""
        , answer = """The Tenth Commandment forbiddeth all discontentment with our own own estate, envying or grieving at the good of our neighbour, and all inordinate motions and affections to any thing that is his."""
        }
      )
    , ( 82
      , { question = """Is any man able perfectly to keep the commandments of God?"""
        , answer = """No mere man since the fall is able in this life perfectly to keep the commandments of God, but doth daily break them in thought, word, and deed."""
        }
      )
    , ( 83
      , { question = """Are all transgression of the law equally heinous?"""
        , answer = """Some sins in themselves, and by reason of several aggravations are more heinous in the sight of God than others."""
        }
      )
    , ( 84
      , { question = """What doth every sin deserve?"""
        , answer = """Every sin deserveth God's wrath and curse, both in this life, and that which is to come."""
        }
      )
    , ( 85
      , { question = """What doth God require of us, that we may escape his wrath and curse due to us for sin?"""
        , answer = """To escape the wrath and curse of God due to us for sin, God requireth of us faith in Jesus Christ, repentance unto life, with the diligent use of all the outward means whereby Christ communicateth to us the benefits of redemption."""
        }
      )
    , ( 86
      , { question = """What is faith in Jesus Christ?"""
        , answer = """Faith in Jesus Christ is a saving grace, whereby we receive and rest upon him alone for salvation, as he is offered to us in the gospel."""
        }
      )
    , ( 87
      , { question = """What is repentance unto life?"""
        , answer = """Repentance unto life is a saving grace, whereby a sinner, out of a true sense of his sin, and apprehension of the mercy of God in Christ, doth, with grief and hatred of his sin, turn from it unto God, with full purpose of, and endeavour after, new obedience."""
        }
      )
    , ( 88
      , { question = """What are the outward means whereby Christ communicateth to us the benefits of redemption?"""
        , answer = """The outward and ordinary means whereby Christ communicateth to us the benefits of redemption, are his ordinances, especially the Word, sacraments, and prayer; all which are made effectual to the elect for salvation."""
        }
      )
    , ( 89
      , { question = """How is the Word made effectual to salvation?"""
        , answer = """The Spirit of God maketh the reading, but especially the preaching of the Word, an effectual means of convincing and converting sinners, and of building them up in holiness and comfort, through faith, unto salvation."""
        }
      )
    , ( 90
      , { question = """How is the Word to be read and heard, that it may become effectual to salvation?"""
        , answer = """The the Word may become effectual to salvation, we must attend thereunto with diligence, preparation, and prayer; receive it with faith and love, lay it up in our hearts, and practise it in our lives."""
        }
      )
    , ( 91
      , { question = """How do the sacraments become effectual means of salvation?"""
        , answer = """The sacraments become effectual means of salvation, not from any virtue in them, or in him that doth administer them; but only by the blessing of Christ, and the working of his Spirit in them that by faith receive them."""
        }
      )
    , ( 92
      , { question = """What is a sacrament?"""
        , answer = """A sacrament is an holy ordinance instituted by Christ, wherein, by sensible signs, Christ, and the benefits of the new covenant, are represented, sealed, and applied to believers."""
        }
      )
    , ( 93
      , { question = """Which are the sacraments of the New Testament?"""
        , answer = """The sacraments of the New Testament are, Baptism, and the Lord's supper."""
        }
      )
    , ( 94
      , { question = """What is baptism?"""
        , answer = """Baptism is a sacrament, wherein the washing with water in the name of the Father, and of the Son, and of the Holy Ghost, doth signify and seal our ingrafting into Christ, and partaking of the benefits of the covenant of grace, and our engagement to be the Lord's."""
        }
      )
    , ( 95
      , { question = """To whom is baptism to be administered?"""
        , answer = """Baptism is not to be administered to any that are out of the visible church, till they profess their faith in Christ, and obedience to him; but the infants of such as are members of the visible church are to be baptized."""
        }
      )
    , ( 96
      , { question = """What is the Lord's supper?"""
        , answer = """The Lord's Supper is a sacrament, wherein, by giving and receiving bread and wine, according to Christ's appointment, his death is showed forth; and the worth receivers are, not after a corporal and carnal manner, but by faith, made partakers of his body and blood, with all his benefits, to their spiritual nourishment, and growth in grace."""
        }
      )
    , ( 97
      , { question = """What is required to be the worthy receiving of the Lord's supper?"""
        , answer = """It is required of them that would worthily partake of the Lord's supper, that they examine themselves of their knowledge to discern the Lord's body, of their faith to feed upon him, of their repentance, love, and new obedience; lest, coming unworthily, they eat and drink judgement to themselves."""
        }
      )
    , ( 98
      , { question = """What is prayer?"""
        , answer = """Prayer is an offering up of our desires unto God for things agreeable to his will, in the name of Christ, with confession of our sins, and thankful acknowledgement of his mercies."""
        }
      )
    , ( 99
      , { question = """What rule hath God given for our direction in prayer?"""
        , answer = """The whole Word of God is of use to direct us in prayer; but the special rule of direction is that form of prayer which Christ taught his disciples, commonly called The Lord's Prayer."""
        }
      )
    , ( 100
      , { question = """What doth the preface of the Lord's prayer teach us?"""
        , answer = """The preface of the Lord's prayer, which is, "Our Father which art in heaven," teacheth us to draw near to God with all holy reverence and confidence, as children to a father, able and ready to help us; and that we should pray with and for others."""
        }
      )
    , ( 101
      , { question = """What do we pray for in the first petition?"""
        , answer = """In the first petition, which is, "Hallowed be thy name," we pray, That God would enable us and others to glorify him in all that whereby he maketh himself known; and that he would dispose all things to his own glory."""
        }
      )
    , ( 102
      , { question = """What do we pray for in the second petition?"""
        , answer = """In the second petition, which is, "Thy kingdom come," we pray, That Satan's kingdom may be destroyed; and that the kingdom of grace may be advanced, ourselves and others brought into it, and kept in it; and the kingdom of glory may be hastened."""
        }
      )
    , ( 103
      , { question = """What do we pray for in the third petition?"""
        , answer = """In the third petition, which is, "Thy will be done in earth, as it is in heaven," we pray, That God, by his grace, would make us able and willing to know, obey, and submit to his will in all things, as the angels do in heaven."""
        }
      )
    , ( 104
      , { question = """What do we pray for in the fourth petition?"""
        , answer = """In the fourth petition, which is, "Give us this day our daily bread," we pray, That of God's free gift we may receive a competent portion of the good things of this life, and enjoy his blessing with them."""
        }
      )
    , ( 105
      , { question = """What do we pray for in the fifth petition?"""
        , answer = """In the fifth petition, which is, "And forgive us our debts, as we forgive our debtors," we pray, That God, for Christ's sake, would freely pardon all our sins; which we are able to be rather encouraged to ask, because by his grace we are enabled from the heart to forgive others."""
        }
      )
    , ( 106
      , { question = """What do we pray for in the sixth petition?"""
        , answer = """In the sixth petition, which is, "And lead us not into temptation, but deliver us from evil," we pray, That God would either keep us from being tempted to sin, or support and deliver us when we are tempted."""
        }
      )
    , ( 107
      , { question = """What doth the conclusion the Lord's prayer teach us?"""
        , answer = """The conclusion of the Lord's prayer, which is, "For thine is the kingdom, and the power, and the glory, for ever, Amen." teacheth us, to take our encouragement in prayer from God only, and in our prayers to praise him, ascribing kingdom, power and glory to him. And, in testimony of our desire, and assurance to be heard, we say, Amen."""
        }
      )
    ]
