<map version="freeplane 1.9.13">
<!--To view this file, download free mind mapping software Freeplane from https://www.freeplane.org -->
<node TEXT="JavaScript async/await" FOLDED="false" ID="ID_696401721" CREATED="1610381621824" MODIFIED="1656729648062" STYLE="oval">
<font SIZE="18"/>
<hook NAME="MapStyle">
    <properties edgeColorConfiguration="#808080ff,#ff0000ff,#0000ffff,#00ff00ff,#ff00ffff,#00ffffff,#7c0000ff,#00007cff,#007c00ff,#7c007cff,#007c7cff,#7c7c00ff" associatedTemplateLocation="template:/standard-1.6.mm" fit_to_viewport="false"/>

<map_styles>
<stylenode LOCALIZED_TEXT="styles.root_node" STYLE="oval" UNIFORM_SHAPE="true" VGAP_QUANTITY="24 pt">
<font SIZE="24"/>
<stylenode LOCALIZED_TEXT="styles.predefined" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="default" ID="ID_271890427" ICON_SIZE="12 pt" COLOR="#000000" STYLE="fork">
<arrowlink SHAPE="CUBIC_CURVE" COLOR="#000000" WIDTH="2" TRANSPARENCY="200" DASH="" FONT_SIZE="9" FONT_FAMILY="SansSerif" DESTINATION="ID_271890427" STARTARROW="NONE" ENDARROW="DEFAULT"/>
<font NAME="SansSerif" SIZE="10" BOLD="false" ITALIC="false"/>
<richcontent CONTENT-TYPE="plain/auto" TYPE="DETAILS"/>
<richcontent TYPE="NOTE" CONTENT-TYPE="plain/auto"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.details"/>
<stylenode LOCALIZED_TEXT="defaultstyle.attributes">
<font SIZE="9"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.note" COLOR="#000000" BACKGROUND_COLOR="#ffffff" TEXT_ALIGN="LEFT"/>
<stylenode LOCALIZED_TEXT="defaultstyle.floating">
<edge STYLE="hide_edge"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.selection" BACKGROUND_COLOR="#4e85f8" BORDER_COLOR_LIKE_EDGE="false" BORDER_COLOR="#4e85f8"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.user-defined" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="styles.topic" COLOR="#18898b" STYLE="fork">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subtopic" COLOR="#cc3300" STYLE="fork">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subsubtopic" COLOR="#669900">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.important" ID="ID_67550811">
<icon BUILTIN="yes"/>
<arrowlink COLOR="#003399" TRANSPARENCY="255" DESTINATION="ID_67550811"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.AutomaticLayout" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="AutomaticLayout.level.root" COLOR="#000000" STYLE="oval" SHAPE_HORIZONTAL_MARGIN="10 pt" SHAPE_VERTICAL_MARGIN="10 pt">
<font SIZE="18"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,1" COLOR="#0033ff">
<font SIZE="16"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,2" COLOR="#00b439">
<font SIZE="14"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,3" COLOR="#990000">
<font SIZE="12"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,4" COLOR="#111111">
<font SIZE="10"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,5"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,6"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,7"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,8"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,9"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,10"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,11"/>
</stylenode>
</stylenode>
</map_styles>
</hook>
<hook NAME="AutomaticEdgeColor" COUNTER="4" RULE="ON_BRANCH_CREATION"/>
<node TEXT="Promise" POSITION="right" ID="ID_13858839" CREATED="1656729649179" MODIFIED="1656729651612">
<edge COLOR="#ff0000"/>
<node TEXT="Executed immediately" ID="ID_593885752" CREATED="1657188879768" MODIFIED="1657188887146"/>
<node TEXT="then" ID="ID_414093054" CREATED="1657189119093" MODIFIED="1657189120040">
<node TEXT="onFulfilled" ID="ID_1094382574" CREATED="1657188888489" MODIFIED="1657188989101">
<node TEXT="function" ID="ID_42231752" CREATED="1657188989706" MODIFIED="1657189018134">
<node TEXT="fulfilled value as input" ID="ID_1291851045" CREATED="1657189026876" MODIFIED="1657189033224"/>
</node>
<node TEXT="value" ID="ID_1548183741" CREATED="1657189020329" MODIFIED="1657189021546">
<node TEXT="x =&gt; x" ID="ID_422844875" CREATED="1657189022129" MODIFIED="1657189095110"/>
</node>
</node>
<node TEXT="onRejected" ID="ID_1135751766" CREATED="1657189035629" MODIFIED="1657189041762">
<node TEXT="function" ID="ID_801939497" CREATED="1657189062427" MODIFIED="1657189069415">
<node TEXT="rejection reason as input" ID="ID_1461920142" CREATED="1657189069773" MODIFIED="1657189073735"/>
</node>
<node TEXT="value" ID="ID_648806540" CREATED="1657189074633" MODIFIED="1657189077492">
<node TEXT="x =&gt; { throw x; }" ID="ID_1962302367" CREATED="1657189078031" MODIFIED="1657189086897"/>
</node>
</node>
<node TEXT="asynchronously" ID="ID_1630612995" CREATED="1657189130253" MODIFIED="1657189140729">
<node TEXT="scheduled in the current thread loop" ID="ID_1826067021" CREATED="1657189142236" MODIFIED="1657189152181"/>
</node>
</node>
</node>
<node TEXT="await" POSITION="right" ID="ID_1233605624" CREATED="1656729652420" MODIFIED="1656729715523">
<edge COLOR="#0000ff"/>
<node TEXT="Only in async function." ID="ID_112804877" CREATED="1656729715848" MODIFIED="1656729720800"/>
</node>
<node TEXT="async" POSITION="right" ID="ID_1094788706" CREATED="1656729660700" MODIFIED="1656729665741">
<edge COLOR="#00ff00"/>
<node TEXT="return value is not a Promise" ID="ID_1048844726" CREATED="1656729666235" MODIFIED="1656729683955">
<node TEXT="wrap into a Promise" ID="ID_1163283566" CREATED="1656729684337" MODIFIED="1656729691189"/>
</node>
<node TEXT="return value is a Promise" ID="ID_161972579" CREATED="1656729692931" MODIFIED="1656729701562">
<node TEXT="return the Promise" ID="ID_651880102" CREATED="1656729702258" MODIFIED="1656729705815"/>
</node>
<node TEXT="Always return a Promise" ID="ID_1515658051" CREATED="1656729725546" MODIFIED="1656729735312"/>
</node>
<node TEXT="yield" POSITION="right" ID="ID_1481977737" CREATED="1656730868417" MODIFIED="1656730871400">
<edge COLOR="#ff00ff"/>
<node TEXT="Generator function" ID="ID_794940297" CREATED="1656730871848" MODIFIED="1656730876631"/>
</node>
</node>
</map>
